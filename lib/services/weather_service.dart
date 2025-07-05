// lib/services/weather_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather_model.dart';

class WeatherService {
  final String _apiKey = '98e8dfcf4ea2319b693eb4c58b2a6018'; // Replace with OpenWeatherMap API key
  final String _baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  Future<WeatherModel> fetchWeatherByCity(String city) async {
    final response = await http.get(Uri.parse('$_baseUrl?q=$city&appid=$_apiKey&units=metric'));

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather');
    }
  }

  Future<WeatherModel> fetchWeatherByCoordinates(double lat, double lon) async {
    final uRL = Uri.parse('$_baseUrl?lat=$lat&lon=$lon&appid=$_apiKey&units=metric');
    print(uRL);
    final response = await http.get(Uri.parse('$_baseUrl?lat=$lat&lon=$lon&appid=$_apiKey&units=metric'));

    if (response.statusCode == 200) {
      print("++++++++++++++++++++++++++++++++++++++++++");
      print(response.body);
      print("++++++++++++++++++++++++++++++++++++++++++");
      return WeatherModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather by coordinates');
    }
  }
}