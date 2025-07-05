// lib/viewmodels/settings_viewmodel.dart
import 'package:basic_weather_app/core/enums.dart';
import 'package:flutter/material.dart';

class SettingsViewModel extends ChangeNotifier {
  TemperatureUnit unit = TemperatureUnit.celsius;

  void toggleUnit() {
    unit = unit == TemperatureUnit.celsius ? TemperatureUnit.fahrenheit : TemperatureUnit.celsius;
    notifyListeners();
  }
}