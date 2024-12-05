import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_forecast/core/error/failure.dart';
import 'package:weather_forecast/features/weather/domain/usecase/get_current_weather_use_case.dart';

import '../../../../helpers/dummy_data/weather_data.dart';
import '../../../../helpers/weather_mock.mocks.dart';

void main() {
  late MockWeatherRepository mockWeatherRepository;

  late GetCurrentWeatherUseCase useCase;

  setUp(() {
    mockWeatherRepository = MockWeatherRepository();
    useCase = GetCurrentWeatherUseCase(mockWeatherRepository);
  });
  test(
    'shoot return [weatherEntity] when repository success',
    () async {
      // arrange
      when(
        mockWeatherRepository.getCurrentWeather(any),
      ).thenAnswer(
        (_) async => Right(tWeatherEntity),
      );

      // act
      final result = await useCase.call(tCityName);

      // assert
      verify(mockWeatherRepository.getCurrentWeather(tCityName));
      expect(result, Right(tWeatherEntity));
    },
  );

  test(
    'shoot return [NotFoundFailure] when repository failed',
    () async {
      // arrange
      when(
        mockWeatherRepository.getCurrentWeather(any),
      ).thenAnswer(
        (_) async => const Left(NotFoundFailure('not found')),
      );

      // act
      final result = await useCase.call(tCityName);

      // assert
      verify(mockWeatherRepository.getCurrentWeather(tCityName));
      expect(result, const Left(NotFoundFailure('not found')));
    },
  );
}
