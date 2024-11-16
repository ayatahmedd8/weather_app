import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/models/weather_model.dart';

class InfoWeatherBody extends StatelessWidget{
  final WeatherModel weatherModel;

  const InfoWeatherBody({super.key, required this.weatherModel});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Text(
           weatherModel.cityName,
           style: const TextStyle(
             fontSize: 32,
             fontWeight:  FontWeight.bold
           ),
         ),
          Text(
            'Updated at ${weatherModel.date.hour}:${weatherModel.date.minute}',
            style: const TextStyle(
                fontSize: 24,
            ),
          ),
          const SizedBox(height: 32,),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                weatherModel.image!.contains("https:")
                    ? weatherModel.image!
                    : "https:${weatherModel.image}"
                ),
               const SizedBox(width: 16),
                Text(
                  weatherModel.temp.toString(),
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('MaxTemp ${weatherModel.MaxTemp.round()}'),
                    Text('MinTemp ${weatherModel.MinTemp.round()}'),
               ],
              ),
             ],
            ),
          const SizedBox(height: 32,),
          Text(
            weatherModel.weatherCondition,
            style: const TextStyle(
                fontSize:32,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}