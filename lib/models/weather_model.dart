// lib/models/weather_model.dart
// class WeatherModel {
//   final String city;
//   final double temperature;
//   final String description;

//   WeatherModel({required this.city, required this.temperature, required this.description});

//   factory WeatherModel.fromJson(Map<String, dynamic> json) {
//     return WeatherModel(
//       city: json['name'],
//       temperature: json['main']['temp'].toDouble(),
//       description: json['weather'][0]['description'],
//     );
//   }
// }

// class WeatherModel {
//   final double temperature;
//   final String description;
//   final double windSpeed;
//   final MainInfo main;

//   WeatherModel({
//     required this.temperature,
//     required this.description,
//     required this.windSpeed,
//     required this.main,
//   });
// }

// class MainInfo {
//   final int humidity;
//   final int pressure;

//   MainInfo({required this.humidity, required this.pressure});
// }

class WeatherModel {
  final double temperature;
  final String description;
  final double windSpeed;
  final MainInfo main;
  final String icon;
  final String city;

  WeatherModel({
    required this.temperature,
    required this.description,
    required this.windSpeed,
    required this.main,
    required this.icon,
    required this.city,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      temperature: json['main']['temp'].toDouble(),
      description: json['weather'][0]['description'],
      windSpeed: json['wind']['speed'].toDouble(),
      main: MainInfo.fromJson(json['main']),
      icon: json['weather'][0]['icon'],
      city: json['name'],
    );
  }
}

class MainInfo {
  final int humidity;
  final int pressure;

  MainInfo({required this.humidity, required this.pressure});

  factory MainInfo.fromJson(Map<String, dynamic> json) {
    return MainInfo(
      humidity: json['humidity'],
      pressure: json['pressure'],
    );
  }
}