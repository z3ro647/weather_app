import 'dart:convert';

import 'package:basic_weather_app/weather_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<WeatherModel> getWeather(String city) async {
    // api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
    // api.openweathermap.org/data/2.5/weather?q=pokhara&appid=98e8dfcf4ea2319b693eb4c58b2a6018

    final queryParameters = {
      'q': city,
      'appid': '98e8dfcf4ea2319b693eb4c58b2a6018',
      'units': 'imperial'
    };

    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameters);

    final response = await http.get(uri);

    final json = jsonDecode(response.body);
    return WeatherModel.fromJson(json);
  }
}
