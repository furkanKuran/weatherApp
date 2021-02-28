import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers/view_models/weather_view_model.dart';

class WeatherTemperature extends StatelessWidget {
  int _index = 0;
  WeatherTemperature(this._index);
  @override
  Widget build(BuildContext context) {
    var temp =
        Provider.of<WeatherViewModel>(context).weather.consolidatedWeather[_index];
    return Center(
      child: Column(
        children: [
          Text(
            "Maximum temperature: " + temp.maxTemp.floor().toString() + " °C",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
          Text(
            "Minimum temperature: " + temp.minTemp.floor().toString() + " °C",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
