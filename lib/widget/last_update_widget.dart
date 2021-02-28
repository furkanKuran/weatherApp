import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers/view_models/weather_view_model.dart';

class LastUpdateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime updateTime =
        Provider.of<WeatherViewModel>(context).weather.time.toLocal();
    return Center(
      child: Text(
        "Update Time: " + TimeOfDay.fromDateTime(updateTime).format(context),
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}
