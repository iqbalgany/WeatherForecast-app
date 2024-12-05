import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_forecast/commons/app_session.dart';

class MockSharedPreferance extends Mock implements SharedPreferences {}

void main() {
  late MockSharedPreferance mockSharedPreferance;
  late AppSession appSession;

  setUp(
    () {
      mockSharedPreferance = MockSharedPreferance();
      appSession = AppSession(mockSharedPreferance);
    },
  );

  test('should return city name when session is present', () async {
    // arrange
    when(
      () => mockSharedPreferance.getString(any()),
    ).thenReturn('Zocco');

    // act
    final result = appSession.cityName;

    // asert
    verify(() => mockSharedPreferance.getString('cityName'));
    expect(result, 'Zocco');
  });

  test('should return null name when session is not present', () async {
    // arrange
    when(
      () => mockSharedPreferance.getString(any()),
    ).thenReturn(null);

    // act
    final result = appSession.cityName;

    // asert
    verify(() => mockSharedPreferance.getString('cityName'));
    expect(result, null);
  });

  test('should return true when success cache session', () async {
    // arrange
    when(
      () => mockSharedPreferance.setString(any(), any()),
    ).thenAnswer((_) async => true);

    // act
    final result = await appSession.saveCityName('Zocco');

    // asert
    verify(() => mockSharedPreferance.setString('cityName', 'Zocco'));
    expect(result, true);
  });

  test('should return false when failed cache session', () async {
    // arrange
    when(
      () => mockSharedPreferance.setString(any(), any()),
    ).thenAnswer((_) async => false);

    // act
    final result = await appSession.saveCityName('Zocco');

    // asert
    verify(() => mockSharedPreferance.setString('cityName', 'Zocco'));
    expect(result, false);
  });
}
