// lib/viewmodels/forecast_viewmodel.dart
import 'package:flutter/material.dart';
import '../models/forecast_model.dart';

class ForecastViewModel extends ChangeNotifier {
  List<ForecastDay> forecast = [];
  bool isLoading = false;

  Future<void> fetchForecast() async {
    isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1)); // Mock for now

    forecast = [
      ForecastDay(day: 'Mon', minTemp: 18, maxTemp: 25, icon: '01d'),
      ForecastDay(day: 'Tue', minTemp: 19, maxTemp: 26, icon: '02d'),
      ForecastDay(day: 'Wed', minTemp: 17, maxTemp: 23, icon: '03d'),
    ];

    isLoading = false;
    notifyListeners();
  }
}