import 'package:flutter/material.dart';
import 'package:weather_app/views/Search_view.dart';


class NoWeatherBody extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Text(
                'There is no weather 😞 Start Searching now 🔍',
            style: TextStyle(
              fontSize: 28
            ),
          ),
        ),
      ),
    );
  }
}