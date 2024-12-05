class URLs {
  /// https://api.openweathermap.org/data/2.5/weather?q={city name},{country code}&appid={API key}
  /// api.openweathermap.org/data/2.5/forecast?q={city name},{country code}&appid={API key}
  static const base = 'https://api.openweathermap.org/data/2.5';

  static weatherIcon(String code) {
    return 'https://openweathermap.org/img/wn/$code@4x.png';
  }
}
