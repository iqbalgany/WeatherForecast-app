import 'package:weather_forecast/features/weather/data/models/weather_model.dart';
import 'package:weather_forecast/features/weather/domain/entities/weather_entitiy.dart';

const tCityName = 'Zocca';

final tWeatherEntity = WeatherEntity(
  id: 501,
  main: 'Rain',
  description: "moderate rain",
  icon: "10d",
  temperature: 298.48,
  pressure: 1015,
  humidity: 64,
  wind: 0.62,
  dateTime: DateTime.fromMillisecondsSinceEpoch(1661870592),
  cityName: "Zocca",
);

final tWeatherModel = WeatherModel(
  id: 501,
  main: 'Rain',
  description: "moderate rain",
  icon: "10d",
  temperature: 298.48,
  pressure: 1015,
  humidity: 64,
  wind: 0.62,
  dateTime: DateTime.fromMillisecondsSinceEpoch(1661870592 * 1000),
  cityName: "Zocca",
);

const tWeatherJsonMap = {
  "weather": [
    {
      "id": 501,
      "main": "Rain",
      "description": "moderate rain",
      "icon": "10d",
    }
  ],
  "main": {
    "temp": 298.48,
    "pressure": 1015,
    "humidity": 64,
  },
  "wind": {
    "speed": 0.62,
  },
  "dt": 1661870592,
  "name": "Zocca",
};
