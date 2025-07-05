import 'package:basic_weather_app/models/weather_model.dart';
import 'package:basic_weather_app/viewmodels/search_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SearchViewModel(),
      child: const SearchScreen(),
    );
  }
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<SearchViewModel>(context);

    return Scaffold(
      backgroundColor: const Color(0xFF0E1220),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              onSubmitted: (value) {
                if (value.trim().isNotEmpty) {
                  vm.searchWeather(value.trim());
                }
              },
              decoration: InputDecoration(
                hintText: 'Search city...',
                hintStyle: const TextStyle(color: Colors.white54),
                filled: true,
                fillColor: const Color(0xFF1A1F36),
                prefixIcon: const Icon(Icons.search, color: Colors.lightBlueAccent),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 32),
            if (vm.isLoading)
              const CircularProgressIndicator(color: Colors.lightBlueAccent)
            else if (vm.weather != null)
              _WeatherDisplay(weather: vm.weather!)
            else if (vm.error != null)
              Text(vm.error!, style: const TextStyle(color: Colors.redAccent)),
          ],
        ),
      ),
    );
  }
}

class _WeatherDisplay extends StatelessWidget {
  final WeatherModel weather;

  const _WeatherDisplay({required this.weather});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          'https://openweathermap.org/img/wn/${weather.icon}@4x.png',
          width: 100,
          height: 100,
          errorBuilder: (context, error, stackTrace) => const Icon(Icons.cloud, size: 100, color: Colors.lightBlueAccent),
        ),
        const SizedBox(height: 16),
        Text(
          '${weather.temperature.toStringAsFixed(0)}°C',
          style: const TextStyle(fontSize: 64, fontWeight: FontWeight.w300, color: Colors.white),
        ),
        const SizedBox(height: 8),
        Text(
          _capitalize(weather.description),
          style: const TextStyle(fontSize: 22, color: Colors.white70),
        ),
        const SizedBox(height: 32),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFF1A1F36),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            children: [
              _WeatherDetailRow(label: 'Humidity', value: '${weather.main.humidity}%'),
              const SizedBox(height: 12),
              _WeatherDetailRow(label: 'Wind', value: '${(weather.windSpeed * 3.6).toStringAsFixed(0)} km/h'),
              const SizedBox(height: 12),
              _WeatherDetailRow(label: 'Pressure', value: '${weather.main.pressure} hPa'),
            ],
          ),
        )
      ],
    );
  }

  String _capitalize(String text) {
    return text.isNotEmpty ? text[0].toUpperCase() + text.substring(1) : text;
  }
}

class _WeatherDetailRow extends StatelessWidget {
  final String label;
  final String value;

  const _WeatherDetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 16)),
        const Spacer(),
        Text(value, style: const TextStyle(color: Colors.white70, fontSize: 16)),
      ],
    );
  }
}
