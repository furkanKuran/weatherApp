import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers/view_models/weather_view_model.dart';

class WeatherImageWidget extends StatelessWidget {
  int _index = 0;
  WeatherImageWidget(this._index);
  @override
  Widget build(BuildContext context) {
    String imageShortName = Provider.of<WeatherViewModel>(context)
        .weather
        .consolidatedWeather[_index]
        .weatherStateAbbr;

    var theTemp = Provider.of<WeatherViewModel>(context)
        .weather
        .consolidatedWeather[_index]
        .theTemp;
    return Column(
      children: [
        Text(
          theTemp.floor().toString() + " °C",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Image.network(
          "https://www.metaweather.com/static/img/weather/png/" +
              imageShortName +
              ".png",
          width: 150,
          height: 150,
        ),
      ],
    );
  }
}
