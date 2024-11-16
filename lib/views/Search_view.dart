import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchView extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search City'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
            onSubmitted: (value) async{

             var getweathercubit= BlocProvider.of<GetWeatherCubit>(context);
             getweathercubit.GetCurrentWeather(cityName: value);
             Navigator.pop(context);

            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 16,horizontal: 16),
              hintText: 'Enter city name',
              suffixIcon: const Icon(Icons.search),
              labelText: 'Search',
              border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(16),
                  borderSide:const BorderSide(
                  color: Colors.green,
                )
              )
            ),
          ),
        ),
      ),
    );
  }
}

