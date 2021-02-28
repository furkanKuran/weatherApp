import 'package:get_it/get_it.dart';
import 'package:providers/data/weather_api_client.dart';
import 'package:providers/data/weather_repository.dart';
import 'package:providers/view_models/old_searchs_model.dart';
import 'package:providers/view_models/weather_view_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => WeatherRepository());
  locator.registerLazySingleton(() => WeatherApiClient());
  locator.registerFactory(() => WeatherViewModel());
  locator.registerSingleton(() => OldSearchModel());
}
