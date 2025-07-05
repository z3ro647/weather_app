// lib/models/forecast_model.dart
class ForecastDay {
  final String day;
  final double minTemp;
  final double maxTemp;
  final String icon;

  ForecastDay({required this.day, required this.minTemp, required this.maxTemp, required this.icon});

  factory ForecastDay.fromJson(Map<String, dynamic> json) {
    return ForecastDay(
      day: json['dt_txt'],
      minTemp: json['main']['temp_min'].toDouble(),
      maxTemp: json['main']['temp_max'].toDouble(),
      icon: json['weather'][0]['icon'],
    );
  }
}