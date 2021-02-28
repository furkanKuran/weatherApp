import 'package:provider/provider.dart';
import 'package:providers/data/weather_api_client.dart';
import 'package:providers/models/weather.dart';

import '../locator.dart';

class WeatherRepository {
  WeatherApiClient weatherApiClient = locator<WeatherApiClient>();
  Future<Weather> getWeatherfromDb(String cityName) async {
    int cityID = await weatherApiClient.getLocationID(cityName);
    return await weatherApiClient.getWeather(cityID);
  }
}
