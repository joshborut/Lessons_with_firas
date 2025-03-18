import 'package:http/http.dart' as http;

import '../../../../env.dart';

class WeatherDataRemoteSource {
  static const _baseUrl = "https://api.openweathermap.org/data/2.5/forecast";

  Future<String> getCurrentWeather(String cityName) => http
      .get(Uri.parse('$_baseUrl?q=$cityName&APPID=${Env.openWeatherAPIKey}'))
      .then((res) => res.body)
      .catchError((e) => throw e.toString());
}
