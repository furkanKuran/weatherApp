import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers/view_models/weather_view_model.dart';

class LocationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var selectedCityName=Provider.of<WeatherViewModel>(context).weather.title;
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
            child: Text(
          selectedCityName,
          style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
