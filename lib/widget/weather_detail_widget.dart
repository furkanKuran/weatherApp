import 'package:flutter/material.dart';
import 'package:providers/widget/on_day_widget.dart';

import 'last_update_widget.dart';
import 'location_widget.dart';
import 'weather_image_widget.dart';
import 'weather_temperature.dart';

class WeatherDetailWidget extends StatefulWidget {
  @override
  _WeatherDetailWidgetState createState() => _WeatherDetailWidgetState();
}

class _WeatherDetailWidgetState extends State<WeatherDetailWidget> {
  var _controllerPageView = PageController(
    initialPage: 0,
    keepPage: true,
  );
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controllerPageView,
      children: [
        weatherPages(0),
        weatherPages(1),
        weatherPages(2),
        weatherPages(3),
        weatherPages(4),
        weatherPages(5),
      ],
    );
  }
}

weatherPages(int index) {
  return ListView(
    children: [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: LocationWidget(),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: LastUpdateWidget(),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: WeatherImageWidget(index),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: WeatherTemperature(index),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: OnDayWidget(index),
      ),
    ],
  );
}
