import 'package:basic_weather_app/app/app.dart';
import 'package:basic_weather_app/providers/theme_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


//void main() => runApp(const WeatherApp());


void main() {
  runApp(
    ChangeNotifierProvider(create: (_) => ThemeProvider(),
    child: const WeatherApp(),)
  );
}