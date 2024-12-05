import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_forecast/commons/app_session.dart';
import 'package:weather_forecast/features/pick_place/presentation/cubit/city_cubit.dart';
import 'package:weather_forecast/features/weather/data/data_source/weather_remote_data_source.dart';
import 'package:weather_forecast/features/weather/data/repositories/weather_repositoriy_impl.dart';
import 'package:weather_forecast/features/weather/domain/repositories/weather_repository.dart';
import 'package:weather_forecast/features/weather/domain/usecase/get_current_weather_use_case.dart';
import 'package:weather_forecast/features/weather/domain/usecase/get_hourly_forecast_use_case.dart';
import 'package:weather_forecast/features/weather/presentation/blocs/current_weather/current_weather_bloc.dart';
import 'package:weather_forecast/features/weather/presentation/blocs/hourly_forecast/hourly_forecast_bloc.dart';

final locator = GetIt.instance;

Future<void> initLocator() async {
  /// CUBIT / BLOC
  locator.registerFactory(() => CityCubit(locator()));
  locator.registerFactory(() => CurrentWeatherBloc(locator(), locator()));
  locator.registerFactory(() => HourlyForecastBloc(locator(), locator()));

  /// USECASE
  locator.registerLazySingleton(() => GetCurrentWeatherUseCase(locator()));
  locator.registerLazySingleton(() => GetHourlyForecastUseCase(locator()));

  /// DATA SOURCE
  locator.registerLazySingleton<WeatherRemoteDataSource>(
      () => WeatherRemoteDataSourceImpl(locator()));

  /// REPOSITORY
  locator.registerLazySingleton<WeatherRepository>(
      () => WeatherRepositoryImpl(locator()));

  /// COMMON
  locator.registerLazySingleton(() => AppSession(locator()));

  /// EXTERNAL
  final pref = await SharedPreferences.getInstance();
  locator.registerLazySingleton(() => pref);
  locator.registerLazySingleton(() => http.Client());
}
