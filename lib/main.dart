import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers/locator.dart';
import 'package:providers/models/weather.dart';
import 'package:providers/view_models/old_searchs_model.dart';
import 'package:providers/view_models/theme_view_model.dart';
import 'package:providers/view_models/weather_view_model.dart';
import 'widget/weather_app.dart';

void main() {
  setupLocator();
  runApp(ChangeNotifierProvider(
      create: (context) => ThemeViewModel(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _themeData = Provider.of<ThemeViewModel>(context);
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: _themeData.color,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<WeatherViewModel>(
              create: (context) => locator<WeatherViewModel>()),
          ChangeNotifierProvider<OldSearchModel>(
              create: (context) => locator<OldSearchModel>()),
        ],
        child: WeatherApp(),
      ),
    );
  }
}
/*ChangeNotifierProvider<WeatherViewModel>(
        create: (context) => locator<WeatherViewModel>(),
        child: WeatherApp(),*/
