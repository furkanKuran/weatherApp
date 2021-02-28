import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers/view_models/weather_view_model.dart';

class OnDayWidget extends StatelessWidget {
  final int _index;
  OnDayWidget(this._index);
  @override
  Widget build(BuildContext context) {
    String theDay = Provider.of<WeatherViewModel>(context)
        .weather
        .consolidatedWeather[_index]
        .applicableDate
        .toLocal()
        .toString();

    return Center(
      child: Text(
        theDay.split(" ")[0],
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
    );
  }
}
