import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:providers/models/weather.dart';

class WeatherApiClient {
  static const baseUrl = "https://www.metaweather.com";
  final http.Client httpClient = http.Client();

  Future<int> getLocationID(String cityName) async {
    final cityURL = baseUrl + "/api/location/search/?query=" + cityName;
    final weatherAnswer = await httpClient.get(cityURL);

    if (weatherAnswer.statusCode != 200) {
      throw Exception("Veri Getirilemedi");
    }

    final weatherAnswerJSON = (jsonDecode(weatherAnswer.body)) as List;
    return weatherAnswerJSON[0]["woeid"];
  }

  Future<Weather> getWeather(int sehirID) async {
    final weatherURL = baseUrl + "/api/location/$sehirID";
    final weatherAnswer = await httpClient.get(weatherURL);
    if (weatherAnswer.statusCode != 200) {
      throw Exception("Hava durumu Getirilemedi");
    }

    final weatherAnswerJSON = jsonDecode(weatherAnswer.body);
    return Weather.fromJson(weatherAnswerJSON);
  }
}
