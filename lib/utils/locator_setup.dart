import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/model/countries.dart';
import 'package:weather_app/services/weather_services/weather_network.dart';

final GetIt serviceLocator = GetIt.I;

Future locatorSetup() async {
  WidgetsFlutterBinding.ensureInitialized();
  serviceLocator.registerLazySingleton(() => WeatherNetwork());
}
