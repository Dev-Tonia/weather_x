import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/services/api_const.dart';

import '../endponits.dart';

class WeatherNetwork {
  Future<WeatherModel> getData(String city) async {
    try {
      http.Response response = await http.get(
        Uri.parse(Endpoints.weatherAPIforCity(
            cityname: city, apiKey: ApiConsts.apiKey)),
      );
      var jsonData = jsonDecode(response.body);
      return WeatherModel.fromJson(jsonData);
    } catch (e) {
      rethrow;
    }
  }
}


// class DataService {
//   Future<WeatherResponse> getWeather(String city) async {
//     // api.openweathermap.org/data/2.5/weather?.q={city name}&appid={API key}

//     final queryParameters = {
//       'q': city,
//       'appid': '98e8dfcf4ea2319b693eb4c58b2a6018',
//       'units': 'imperial'
//     };

//     final uri = Uri.https(
//         'api.openweathermap.org', '/data/2.5/weather', queryParameters);

//     final response = await http.get(uri);

//     print(response.body);
//     final json = jsonDecode(response.body);
//     return WeatherResponse.fromJson(json);
//   }
// }
