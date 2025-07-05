// lib/widgets/weather_card.dart
import 'package:flutter/material.dart';
import '../models/weather_model.dart';

class WeatherCard extends StatelessWidget {
  final WeatherModel weather;
  const WeatherCard({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      color: Colors.blueAccent,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(weather.city, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 12),
            Text('${weather.temperature}°C', style: const TextStyle(fontSize: 60, fontWeight: FontWeight.w300, color: Colors.white)),
            Text(weather.description, style: const TextStyle(fontSize: 18, color: Colors.white70)),
          ],
        ),
      ),
    );
  }
}