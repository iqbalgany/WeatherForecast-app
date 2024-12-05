import 'package:shared_preferences/shared_preferences.dart';

class AppSession {
  AppSession(this._pref);
  final SharedPreferences _pref;

  static const _cityNameKey = 'cityName';

  String? get cityName => _pref.getString(_cityNameKey);

  Future<bool> saveCityName(String n) async {
    return _pref.setString(_cityNameKey, n);
  }
}
