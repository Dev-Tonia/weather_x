import 'package:flutter/cupertino.dart';

import '../model/countries.dart';
import '../model/weather_model.dart';
import '../services/weather_services/weather_network.dart';
import '../utils/locator_setup.dart';

class HomeViewModel extends ChangeNotifier {
  final weatherService = serviceLocator<WeatherNetwork>();

  String city = Cities.citySelected;

  WeatherModel? weatherModel;

  bool? isLoading = false;

  Future<void> init() async {
    setIsLoading(v: true);
    await weatherService.getData(city).then((value) {
      weatherModel = value;
      setIsLoading(v: false);
    });
  }

  void setIsLoading({bool? v}) {
    isLoading = v;
    notifyListeners();
  }

  Future<void> selectedCity(String city) async {
    Cities.citySelected = city;
    await weatherService
        .getData(Cities.citySelected)
        .then((data) => weatherModel = data);
    notifyListeners();
  }
}
