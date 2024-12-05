import 'package:dartz/dartz.dart';
import 'package:weather_forecast/core/error/failure.dart';
import 'package:weather_forecast/features/weather/domain/entities/weather_entitiy.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherEntity>> getCurrentWeather(String cityName);
  Future<Either<Failure, List<WeatherEntity>>> getHourlyForecast(
      String cityName);
}
