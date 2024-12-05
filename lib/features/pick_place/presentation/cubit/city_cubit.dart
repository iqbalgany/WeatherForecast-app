import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast/commons/app_session.dart';

class CityCubit extends Cubit<String> {
  final AppSession appSession;
  CityCubit(this.appSession) : super('');

  String init() {
    String? city = appSession.cityName;
    if (city != null) emit(city);
    return state;
  }

  listenChange(String n) {
    emit(n);
  }

  saveCity() {
    appSession.saveCityName(state);
  }
}
