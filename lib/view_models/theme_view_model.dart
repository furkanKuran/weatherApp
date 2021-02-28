import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeViewModel with ChangeNotifier {
  ThemeData _mainTheme;
  MaterialColor _color;

  ThemeViewModel() {
    _mainTheme = ThemeData();
    _color = Colors.blue;
  }
  get color => _color;
  set color(value) {
    _color = value;

    notifyListeners();
  }

  get mainTheme => _mainTheme;
  set mainTheme(value) {
    _mainTheme = value;
    notifyListeners();
  }

  changeThemeofApp(String shortNameofWeather) {
    ThemeData appThemeData;
    Color _colorApp;
    switch (shortNameofWeather) {
      case "sn":
      case "sl":
      case "h":
      case "t":
      case "hr":
      case "lr":
      case "s":
        {
          appThemeData = ThemeData(primaryColor: Colors.blueGrey);
          _colorApp = Colors.grey;
        }
        break;
      case "hc":
      case "lc":
      case "c":
        {
          appThemeData = ThemeData(primaryColor: Colors.orangeAccent);
          _colorApp = Colors.orange;
        }
        break;
      default:
        {
          appThemeData = ThemeData(primaryColor: Colors.blue);
          _colorApp = Colors.white;
        }
    }
    color = _colorApp;
    mainTheme = appThemeData;
  }
}
/**  String shortName=shortNameofWeather;
Switch(shortName){


_mainTheme=ThemeData(primaryColor:Colors.blueGrey);
_color = Colors.grey;
 break;




}
 */
