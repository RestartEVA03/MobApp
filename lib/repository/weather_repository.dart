
import 'package:first_proj/api_constants.dart';

import '../db/database_provider.dart';
import 'weather_api_service.dart';
import '../db/entity/weather_entity.dart';

class WeatherRepository {
  final databaseProvider = DatabaseProvider();

  Future<Weather> getWeather() async {
    final database = await databaseProvider.database;
    final weatherDao = database.weatherDao;
    final weather = await weatherDao.findLatestWeatherByCity(city);
    if (weather != null && DateTime.now().difference(weather.dateTime).inMinutes < 10) {
      return weather;
    } else {
      return await updateWeather(city);
    }
  }

  Future<Weather> getWeatherByCity(String cityName) async {
    final database = await databaseProvider.database;
    final weatherDao = database.weatherDao;
    final weather = await weatherDao.findLatestWeatherByCity(cityName);
    if (weather != null && DateTime.now().difference(weather.dateTime).inMinutes < 10) {
      return weather;
    } else {
      return await updateWeather(cityName);
    }
  }

  Future<Weather> updateWeather(String cityName) async {
    final weather = await ApiService.fetchWeatherForCity(cityName);
    final database = await databaseProvider.database;
    final weatherDao = database.weatherDao;
    await weatherDao.insertWeather(weather);
    return weather;
  }
}
