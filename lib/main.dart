import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_forecast/commons/enum.dart';
import 'package:weather_forecast/features/pick_place/presentation/cubit/city_cubit.dart';
import 'package:weather_forecast/features/pick_place/presentation/pages/pick_place_page.dart';
import 'package:weather_forecast/features/weather/presentation/blocs/current_weather/current_weather_bloc.dart';
import 'package:weather_forecast/features/weather/presentation/blocs/hourly_forecast/hourly_forecast_bloc.dart';
import 'package:weather_forecast/features/weather/presentation/pages/current_weather_page.dart';
import 'package:weather_forecast/features/weather/presentation/pages/hourly_forecase_page.dart';
import 'package:weather_forecast/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocator();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => locator<CityCubit>()),
        BlocProvider(create: (context) => locator<CurrentWeatherBloc>()),
        BlocProvider(create: (context) => locator<HourlyForecastBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          textTheme: GoogleFonts.poppinsTextTheme(),
          progressIndicatorTheme: const ProgressIndicatorThemeData(
            color: Colors.white,
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const CurrentWeatherPage(),
          AppRoute.pickPlace.name: (context) => const PickPlacePage(),
          AppRoute.hourlyForecast.name: (context) => const HourlyForecasePage(),
        },
      ),
    );
  }
}
