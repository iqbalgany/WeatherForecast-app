import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:weather_forecast/features/weather/domain/repositories/weather_repository.dart';

@GenerateNiceMocks([
  MockSpec<WeatherRepository>(as: #MockWeatherRepository),
  MockSpec<http.Client>(as: #MockHttpClient),
])
void main() {}
