import 'package:flutter/material.dart';
import '../models/weather_model.dart';
import '../services/weather_service.dart';

class SearchViewModel extends ChangeNotifier {
  final WeatherService _weatherService = WeatherService();

  WeatherModel? weather;
  bool isLoading = false;
  String? error;

  Future<void> searchWeather(String city) async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      weather = await _weatherService.fetchWeatherByCity(city);
    } catch (e) {
      error = 'City not found or API error';
    }

    isLoading = false;
    notifyListeners();
  }
}
