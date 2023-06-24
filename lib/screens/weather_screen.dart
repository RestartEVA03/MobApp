import 'package:flutter/material.dart';

import '../db/entity/weather_entity.dart';
import '../repository/weather_repository.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData.dark(),
      home: WeatherPage(),
    );
  }
}

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final repository = WeatherRepository();
  late Future<Weather> futureWeather;
  bool isReloading = false; // Add a loading flag

  @override
  void initState() {
    super.initState();
    futureWeather = Future.delayed(Duration(seconds: 1), () {
      return repository.getWeather();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
      ),
      body: FutureBuilder<Weather>(
        future: futureWeather,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Error: ${snapshot.error}'),
                  ElevatedButton(
                    onPressed: _refreshWeather,
                    child: Text('Retry'),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasData) {
            final weather = snapshot.data!;

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${weather.temperature}°C',
                    style: TextStyle(fontSize: 48),
                  ),
                  Image.network(weather.iconUrl),
                  Text(
                    weather.description,
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    weather.locationName,
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: SpinKitCircle(
                color: Theme.of(context).primaryColor,
                size: 48.0,
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: isReloading ? null : _refreshWeather,
        // Disable click while loading
        child: isReloading
            ? SpinKitCircle(
                color: Colors.white,
                size: 24.0,
              )
            : Icon(Icons.refresh), // Show loading icon if isLoading is true
      ),
    );
  }

  void _refreshWeather() {
    setState(() {
      isReloading = true; // Set loading flag to true
    });

    futureWeather = Future.delayed(Duration(seconds: 1), () {
      return repository.updateWeather();
    });

    futureWeather.then((weather) {
      setState(() {
        isReloading = false;
      });
    }).catchError((error) {
      setState(() {
        isReloading = false;
      });
    });
  }
}
