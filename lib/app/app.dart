// lib/app/app.dart
import 'package:basic_weather_app/providers/theme_providers.dart';
import 'package:basic_weather_app/thems/app_theme.dart';
import 'package:basic_weather_app/views/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app/router.dart';

// class WeatherApp extends StatelessWidget {
//   const WeatherApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: AppTheme.light,
//       darkTheme: AppTheme.dark,
//       initialRoute: AppRouter.home,
//       routes: AppRouter.routes,
//     );
//   }
// }

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) {
        return MaterialApp(debugShowCheckedModeBanner: false,
          theme: themeProvider.isDarkMode ? _darkTheme : _lightTheme,
          home: const HomeScreen(),);
      },
    );
  }
}

final ThemeData _darkTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: const Color(0xFF0E1220),
  primaryColor: Colors.lightBlueAccent,
);

final ThemeData _lightTheme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: Colors.white,
  primaryColor: Colors.blue,
);