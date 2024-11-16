import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
          builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
                builder: (context, state) {
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    theme: ThemeData(
                        primarySwatch: getThemeColor(
                            BlocProvider.of<GetWeatherCubit>(context)
                                .weatherModel
                                ?.weatherCondition)
                    ),
                    home: HomeView(),
                  );
                },
              )
      ),
    );
  }


  MaterialColor getThemeColor(String? condition) {
    if (condition == null) {
      return Colors.blue;
    }
    switch (condition.toLowerCase()) {
      case 'sunny':
      case 'clear':
        return Colors.orange;
      case 'partly cloudy':
      case 'cloudy':
      case 'overcast':
        return Colors.blue;
      case 'mist':
      case 'fog':
      case 'freezing fog':
        return Colors.grey;
      case 'patchy rain possible':
      case 'light drizzle':
      case 'freezing drizzle':
      case 'light rain':
      case 'moderate rain at times':
      case 'moderate rain':
      case 'heavy rain at times':
      case 'heavy rain':
      case 'light freezing rain':
      case 'moderate or heavy freezing rain':
        return Colors.blue;
      case 'patchy snow possible':
      case 'light sleet':
      case 'moderate or heavy sleet':
      case 'patchy light snow':
      case 'light snow':
      case 'patchy moderate snow':
      case 'moderate snow':
      case 'patchy heavy snow':
      case 'heavy snow':
      case 'ice pellets':
        return Colors.lightBlue;
      case 'thundery outbreaks possible':
      case 'patchy light rain with thunder':
      case 'moderate or heavy rain with thunder':
      case 'patchy light snow with thunder':
      case 'moderate or heavy snow with thunder':
        return Colors.amber;
      default:
        return Colors.grey;
    }
  }
}
