// lib/app/router.dart
import 'package:flutter/material.dart';
import '../views/home/home_screen.dart';
import '../views/forecast/forecast_screen.dart';
import '../views/location/location_search_screen.dart';
import '../views/settings/settings_screen.dart';

class AppRouter {
  static const String home = '/';
  static const String forecast = '/forecast';
  static const String location = '/location';
  static const String settings = '/settings';

  static final Map<String, WidgetBuilder> routes = {
    home: (_) => const HomeScreen(),
    //forecast: (_) => const ForecastScreen(),
    forecast: (_) => ForecastTab(),
    location: (_) => const LocationSearchScreen(),
    settings: (_) => const SettingsTab(),
  };
}