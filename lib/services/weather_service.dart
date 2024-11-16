import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService{

 final Dio dio;
 final String baseUrl='https://api.weatherapi.com/v1';
 final String apiKey='330534ce2e404f1e98c145744242910';
  WeatherService(this.dio);

   Future<WeatherModel> GetCurrentWeather({required String cityName}) async{
  try {
    Response respone = await dio.get(
        '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
    WeatherModel weatherModel = WeatherModel.fromjson(respone.data);
    return weatherModel;

  }on DioException catch(e){

    final String errorMessage=e.response?.data['error']['message'];
    throw Exception(errorMessage);

  }catch(e){

    throw Exception('oops, there was an error try later');

  }

   }
}