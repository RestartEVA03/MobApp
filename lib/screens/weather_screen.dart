import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mobx/mobx.dart';
import '../api_constants.dart';
import '../models/weather_store.dart';

final weatherStore = WeatherStore();

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final TextEditingController cityController = TextEditingController(text: city);

  @override
  void initState() {
    super.initState();
    weatherStore.loadInitialWeather();
  }

  @override
  void dispose() {
    cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: cityController,
                onChanged: weatherStore.setCityName,
                decoration: InputDecoration(
                  labelText: 'Enter City Name',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: weatherStore.fetchWeatherByCity,
              child: Text('Get Weather'),
            ),
            SizedBox(height: 16.0),
            Observer(builder: (context) {
              final futureWeather = weatherStore.futureWeather;

              if (futureWeather.value == null) {
                return Container();
              } else if (futureWeather.status == FutureStatus.rejected) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Error: ${futureWeather.error}'),
                      ElevatedButton(
                        onPressed: weatherStore.refreshWeather,
                        child: Text('Retry'),
                      ),
                    ],
                  ),
                );
              } else if (futureWeather.status == FutureStatus.pending) {
                return Center(
                  child: SpinKitCircle(
                    color: Colors.white,
                    size: 24.0,
                  ),
                );
              } else {
                final weather = futureWeather.value!;

                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${weather.temperature}°C',
                        style: TextStyle(fontSize: 48),
                      ),
                      Container(
                        width: 200,
                        height: 200,
                        child: Image.network(
                          weather.iconUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
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
              }
            }),
          ],
        ),
      ),
      floatingActionButton: Observer(builder: (context) {
        return FloatingActionButton(
          onPressed: weatherStore.isReloading ? null : weatherStore.refreshWeather,
          child: weatherStore.isReloading
              ? SpinKitCircle(
            color: Colors.white,
            size: 24.0,
          )
              : Icon(Icons.refresh),
        );
      }),
    );
  }
}
