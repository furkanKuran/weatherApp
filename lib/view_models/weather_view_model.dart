import 'package:flutter/material.dart';
import 'package:providers/locator.dart';
import 'package:providers/models/weather.dart';
import 'package:providers/data/weather_repository.dart';
import 'package:providers/view_models/old_searchs_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum WeatherState {
  WeatherInitializationState,
  WeatherLoadingState,
  WeatherLoadedState,
  WeatherErrorState
}

class WeatherViewModel with ChangeNotifier {
  Weather _weather;
  WeatherRepository _repository = locator<WeatherRepository>();
  WeatherState _state;
  WeatherViewModel() {
    _weather = Weather();
    _state = WeatherState.WeatherInitializationState;
  }

  Weather get weather {
    return _weather;
  }

  get state => _state;

  set state(WeatherState value) {
    _state = value;
    notifyListeners();
  }

  Future<Weather> getWeather(String cityName) async {
    try {
      state = WeatherState.WeatherLoadingState;
      _weather = await _repository.getWeatherfromDb(cityName);
      state = WeatherState.WeatherLoadedState;
      
    } catch (e) {
      debugPrint("hata:" + e.toString());
      state = WeatherState.WeatherErrorState;
    }

    return _weather;
  }

  Future<Weather> updateWeather(String cityName) async {
    try {
      _weather = await _repository.getWeatherfromDb(cityName);
      state = WeatherState.WeatherLoadedState;
    } catch (e) {
      debugPrint("hata:" + e.toString());
    }

    return _weather;
  }
}
