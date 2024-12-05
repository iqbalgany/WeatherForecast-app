import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast/commons/app_session.dart';
import 'package:weather_forecast/features/weather/domain/entities/weather_entitiy.dart';
import 'package:weather_forecast/features/weather/domain/usecase/get_current_weather_use_case.dart';

part 'current_weather_event.dart';
part 'current_weather_state.dart';

class CurrentWeatherBloc
    extends Bloc<CurrentWeatherEvent, CurrentWeatherState> {
  final GetCurrentWeatherUseCase _useCase;
  final AppSession _appSession;
  CurrentWeatherBloc(this._useCase, this._appSession)
      : super(CurrentWeatherInitial()) {
    on<OnGetCurrentWeather>((event, emit) async {
      String? cityName = _appSession.cityName;
      if (cityName == null) return;

      emit(CurrentWeatherLoading());
      final result = await _useCase(cityName);
      result.fold(
        (failure) => emit(CurrentWeatherFailure(failure.message)),
        (data) => emit(CurrentWeatherLoaded(data)),
      );
    });
  }
}
