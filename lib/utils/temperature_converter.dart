// lib/utils/temperature_converter.dart
import 'package:basic_weather_app/core/enums.dart';

class TemperatureConverter {
  static double convert(double tempCelsius, TemperatureUnit unit) {
    if (unit == TemperatureUnit.fahrenheit) {
      return tempCelsius * 9 / 5 + 32;
    }
    return tempCelsius;
  }
}