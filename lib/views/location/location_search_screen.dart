// lib/views/location/location_search_screen.dart
import 'package:basic_weather_app/app/router.dart';
import 'package:flutter/material.dart';

class LocationSearchScreen extends StatelessWidget {
  const LocationSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search Location')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Location search UI goes here'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, AppRouter.home),
              child: const Text('Home'),
            ),
          ],
        ),
      ),
    );
  }
}