import 'package:dartz/dartz.dart';
import 'package:weather_forecast/core/error/failure.dart';
import 'package:weather_forecast/features/weather/domain/entities/weather_entitiy.dart';
import 'package:weather_forecast/features/weather/domain/repositories/weather_repository.dart';

class GetHourlyForecastUseCase {
  final WeatherRepository _repository;

  GetHourlyForecastUseCase(this._repository);

  Future<Either<Failure, List<WeatherEntity>>> call(String cityName) {
    return _repository.getHourlyForecast(cityName);
  }
}
