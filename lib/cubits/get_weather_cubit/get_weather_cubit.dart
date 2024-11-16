import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/models/weather_model.dart';

import '../../services/weather_service.dart';
import '../../views/Search_view.dart';
import 'get_weather_states.dart';

class GetWeatherCubit extends Cubit<WeatherState>{
  GetWeatherCubit():super(NoWeatherState());
    WeatherModel? weatherModel;

  GetCurrentWeather({required String cityName}) async {
    try {
      WeatherModel weatherModel = await WeatherService(Dio()).GetCurrentWeather(
          cityName: cityName);

      emit(WeatherLoadedState(weatherModel));

    }catch(e){
      emit(WeatherFailureState(e.toString()));
    }
  }
}