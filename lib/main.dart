import 'package:basic_weather_app/api_service.dart';
import 'package:basic_weather_app/weather_model.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basic Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Weather App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<WeatherModel> futureWeather;
  TextEditingController city = TextEditingController();
  final _cityKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureWeather = ApiService().getWeather('Pokhara');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          FutureBuilder<WeatherModel>(
            future: futureWeather,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      snapshot.data!.name.toString(),
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      snapshot.data!.main!.temp.toString(),
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      snapshot.data!.weather![0].main.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      snapshot.data!.weather![0].description.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Image.network(
                      'https://openweathermap.org/img/w/${snapshot.data!.weather![0].icon}.png',
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 16,
            ),
            child: Form(
              key: _cityKey,
              child: TextFormField(
                controller: city,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your City name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter city name';
                  }
                  return null;
                },
              ),
            ),
          ),
          ElevatedButton.icon(
            onPressed: () async {
              if (_cityKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    duration: Duration(seconds: 2),
                    content: Text('Processing Data'),
                  ),
                );
                setState(() {
                  futureWeather = ApiService().getWeather(city.text);
                  city.clear();
                });
              }
            },
            icon: const Icon(
              Icons.search,
            ),
            label: const Text('Search'),
          )
        ],
      ),
    );
  }
}
