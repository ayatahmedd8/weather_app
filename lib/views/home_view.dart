import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/Search_view.dart';
import 'package:weather_app/widgets/InfoWeatherBody.dart';
import 'package:weather_app/widgets/NoWeatherBody.dart';

class HomeView extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return SearchView();
            }));},
              icon: const Icon(Icons.search))
        ],
      ),
      body:  BlocBuilder<GetWeatherCubit,WeatherState>(
        builder: (context,state){
          if(state is NoWeatherState){
            return NoWeatherBody();
          }else if(state is WeatherLoadedState){
             return InfoWeatherBody(weatherModel: state.weatherModel,);
          }else{
            return const Text('oops there was an error!');
          }
        },
      )
    );
  }
}