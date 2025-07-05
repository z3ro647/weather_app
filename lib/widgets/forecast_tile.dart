// lib/widgets/forecast_tile.dart
import 'package:flutter/material.dart';
import '../models/forecast_model.dart';

class ForecastTile extends StatelessWidget {
  final ForecastDay day;
  const ForecastTile({super.key, required this.day});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: Image.network('https://openweathermap.org/img/wn/${day.icon}@2x.png'),
        title: Text(day.day, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('Min: ${day.minTemp}°C  Max: ${day.maxTemp}°C'),
      ),
    );
  }
}