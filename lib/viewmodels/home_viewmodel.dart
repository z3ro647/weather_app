// lib/viewmodels/home_viewmodel.dart
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../models/weather_model.dart';
import '../services/weather_service.dart';
import '../services/location_service.dart';

class HomeViewModel extends ChangeNotifier {
  final WeatherService _weatherService = WeatherService();
  final LocationService _locationService = LocationService();

  WeatherModel? weather;
  bool isLoading = false;

  Future<void> getWeatherFromLocation() async {
    isLoading = true;
    notifyListeners();

    try {
      Position position = await _locationService.getCurrentLocation();
      print("++++++++++++++++++++++++++++++++++++++++++++++++++++++");
      print(position);
      print("++++++++++++++++++++++++++++++++++++++++++++++++++++++");
      weather = await _weatherService.fetchWeatherByCoordinates(position.latitude, position.longitude);
    } catch (e) {
      debugPrint('Error: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}