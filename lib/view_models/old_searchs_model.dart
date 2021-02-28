import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:providers/models/weather.dart';
import 'package:providers/view_models/weather_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OldSearchModel with ChangeNotifier {
  addCitytoSf({@required int index, @required Weather weather}) async {
    List<String> savedCity = [
      weather.consolidatedWeather[0].weatherStateName,
      weather.consolidatedWeather[0].maxTemp.toString(),
      weather.consolidatedWeather[0].minTemp.toString(),
      weather.consolidatedWeather[0].theTemp.toString(),
      weather.consolidatedWeather[0].weatherStateAbbr,
    ];
    SharedPreferences cityPref = await SharedPreferences.getInstance();
    cityPref.setStringList("city" + index.toString(), savedCity);
    if (cityPref.containsKey("city" + index.toString())) {
      debugPrint("${"city" + index.toString()} dolduruldu.");
    }
    notifyListeners();
  }

  List<String> getCityfromSf(@required int index) {
    SharedPreferences city;
    SharedPreferences.getInstance().then((value) => city = value);
    try {
      var cityList = city.getStringList("city" + index.toString());
      return cityList;
    } catch (e) {
      return null;
    }
  }

  List<List<String>> getAllCityFromSf() {
    List<List<String>> cities = [];

    var city_1 = getCityfromSf(1) != null ? cities.add(getCityfromSf(1)) : null;
    var city_2 = getCityfromSf(2) != null ? cities.add(getCityfromSf(2)) : null;
    var city_3 = getCityfromSf(3) != null ? cities.add(getCityfromSf(3)) : null;
    var city_4 = getCityfromSf(4) != null ? cities.add(getCityfromSf(4)) : null;
    var city_5 = getCityfromSf(5) != null ? cities.add(getCityfromSf(5)) : null;

    return cities;
  }
}
