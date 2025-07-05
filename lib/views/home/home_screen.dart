// lib/views/home/home_screen.dart
import 'package:basic_weather_app/views/forecast/forecast_screen.dart';
import 'package:basic_weather_app/views/search/search_screen.dart';
import 'package:basic_weather_app/views/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/home_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const WeatherHomeTab(),
    ForecastTab(),
    const SearchTab(),
    const SettingsTab(), // SettingsTab
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E1220),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF1A1F36),
        selectedItemColor: Colors.lightBlueAccent,
        unselectedItemColor: Colors.white38,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.view_week), label: 'Forcast'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}

class WeatherHomeTab extends StatelessWidget {
  const WeatherHomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel()..getWeatherFromLocation(),
      child: Consumer<HomeViewModel>(
        builder: (context, vm, _) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (vm.isLoading)
                  const CircularProgressIndicator(color: Colors.lightBlueAccent)
                else if (vm.weather != null)
                  Column(
                    children: [
                      Image.network(
                        'https://openweathermap.org/img/wn/${vm.weather!.icon}@4x.png',
                        width: 100,
                        height: 100,
                        errorBuilder: (context, error, stackTrace) => const Icon(
                          Icons.cloud,
                          size: 100,
                          color: Colors.lightBlueAccent,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        '${vm.weather!.temperature.toStringAsFixed(0)}°C',
                        style: const TextStyle(
                          fontSize: 64,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _capitalize(vm.weather!.description),
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.white70,
                        ),
                      ),
                      const SizedBox(height: 32),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 32),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1F36),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _WeatherDetailRow(
                              icon: Icons.opacity,
                              label: 'Humidity',
                              value: '${vm.weather!.main.humidity}%',
                            ),
                            const SizedBox(height: 12),
                            _WeatherDetailRow(
                              icon: Icons.air,
                              label: 'Wind',
                              value: '${(vm.weather!.windSpeed * 3.6).toStringAsFixed(0)} km/h',
                            ),
                            const SizedBox(height: 12),
                            _WeatherDetailRow(
                              icon: Icons.speed,
                              label: 'Pressure',
                              value: '${vm.weather!.main.pressure} hPa',
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                else
                  const Text("No weather data available", style: TextStyle(color: Colors.white)),
              ],
            ),
          );
        },
      ),
    );
  }

  String _capitalize(String text) {
    return text.isNotEmpty ? text[0].toUpperCase() + text.substring(1) : text;
  }
}

class _WeatherDetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _WeatherDetailRow({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.lightBlueAccent),
        const SizedBox(width: 12),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 16)),
        const Spacer(),
        Text(value, style: const TextStyle(color: Colors.white70, fontSize: 16)),
      ],
    );
  }
}
