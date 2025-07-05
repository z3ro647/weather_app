// // lib/views/forecast/forecast_screen.dart
// import 'package:basic_weather_app/app/router.dart';
// import 'package:flutter/material.dart';

// class ForecastScreen extends StatelessWidget {
//   const ForecastScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Forecast')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text('7-day forecast will go here'),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () => Navigator.pushNamed(context, AppRouter.home),
//               child: const Text('Home'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ForecastTab extends StatelessWidget {
  ForecastTab({super.key});

  final List<Map<String, dynamic>> forecastData = [
    {'day': 'Mon', 'low': '24°', 'high': '31°', 'icon': '01d'},
    {'day': 'Tue', 'low': '25°', 'high': '32°', 'icon': '02d'},
    {'day': 'Wed', 'low': '23°', 'high': '30°', 'icon': '03d'},
    {'day': 'Thu', 'low': '22°', 'high': '29°', 'icon': '04d'},
    {'day': 'Fri', 'low': '21°', 'high': '28°', 'icon': '10d'},
    {'day': 'Sat', 'low': '22°', 'high': '27°', 'icon': '09d'},
    {'day': 'Sun', 'low': '23°', 'high': '30°', 'icon': '11d'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E1220),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '7-Day Forecast',
              style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter city',
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
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                color: const Color(0xFF1A1F36),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: const [
                  Icon(Icons.location_on, color: Colors.lightBlueAccent),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Dubai',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white38),
                ],
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 140,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: forecastData.length,
                itemBuilder: (context, index) {
                  final day = forecastData[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: _ForecastDayTile(
                      day: day['day'],
                      low: day['low'],
                      high: day['high'],
                      icon: day['icon'],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ForecastDayTile extends StatelessWidget {
  final String day;
  final String low;
  final String high;
  final String icon;

  const _ForecastDayTile({required this.day, required this.low, required this.high, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1F36),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            'https://openweathermap.org/img/wn/$icon@2x.png',
            width: 40,
            height: 40,
            errorBuilder: (context, error, stackTrace) => const Icon(Icons.cloud, color: Colors.lightBlueAccent),
          ),
          const SizedBox(height: 6),
          Text(day, style: const TextStyle(color: Colors.white, fontSize: 14)),
          const SizedBox(height: 6),
          Text(low, style: const TextStyle(color: Colors.white70)),
          Text(high, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
