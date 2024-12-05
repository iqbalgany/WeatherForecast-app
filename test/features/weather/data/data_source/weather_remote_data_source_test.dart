import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:weather_forecast/api/key.dart';
import 'package:weather_forecast/api/urls.dart';
import 'package:weather_forecast/core/error/exception.dart';
import 'package:weather_forecast/features/weather/data/data_source/weather_remote_data_source.dart';

import '../../../../helpers/dummy_data/weather_data.dart';
import '../../../../helpers/json_reader.dart';
import '../../../../helpers/weather_mock.mocks.dart';

void main() {
  late MockHttpClient mockHttpClient;
  late WeatherRemoteDataSourceImpl remoteDataSourceImpl;

  setUp(() {
    mockHttpClient = MockHttpClient();
    remoteDataSourceImpl = WeatherRemoteDataSourceImpl(mockHttpClient);
  });

  test(
    'should return [WeatherModel], when status code 200',
    () async {
      /// arrange
      when(mockHttpClient.get(any)).thenAnswer(
        (_) async => http.Response(readJson('current_weather.json'), 200),
      );

      /// act
      final result = await remoteDataSourceImpl.getCurrentWeather(tCityName);

      /// assert
      String countryCode = 'ID';
      Uri uri = Uri.parse(
          '${URLs.base}/weather?q=$tCityName,$countryCode&appid=$apiKey');

      verify(mockHttpClient.get(uri));
      expect(result, tWeatherModel);
    },
  );

  test(
    'should throw [NotFoundException], when status code 404',
    () async {
      /// arrange
      when(mockHttpClient.get(any)).thenAnswer(
        (_) async => http.Response('not found', 404),
      );

      /// act
      final result = remoteDataSourceImpl.getCurrentWeather(tCityName);

      /// assert
      String countryCode = 'ID';
      Uri uri = Uri.parse(
          '${URLs.base}/weather?q=$tCityName,$countryCode&appid=$apiKey');

      verify(mockHttpClient.get(uri));
      expect(result, throwsA(isA<NotFoundException>()));
    },
  );

  test(
    'should throw [ServerException], when status code is not 200 and 404',
    () async {
      /// arrange
      when(mockHttpClient.get(any)).thenAnswer(
        (_) async => http.Response('server error', 500),
      );

      /// act
      final result = remoteDataSourceImpl.getCurrentWeather(tCityName);

      /// assert
      String countryCode = 'ID';
      Uri uri = Uri.parse(
          '${URLs.base}/weather?q=$tCityName,$countryCode&appid=$apiKey');

      verify(mockHttpClient.get(uri));
      expect(result, throwsA(isA<ServerException>()));
    },
  );
}
