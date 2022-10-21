class Endpoints {
  static String weatherAPIforLocation(
          {String? lat, String? lon, String? apiKey}) =>
      'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric';
  static String weatherAPIforCity({String? cityname, String? apiKey}) =>
      'https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=$apiKey&units=metric';
}
