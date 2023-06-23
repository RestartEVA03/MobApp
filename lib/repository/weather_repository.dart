
import '../db/database_provider.dart';
import 'weather_api_service.dart';
import '../db/entity/weather_entity.dart';

class WeatherRepository {
  final databaseProvider = DatabaseProvider();

  Future<Weather> getWeather() async {
    final database = await databaseProvider.database;
    final weatherDao = database.weatherDao;
    final weather = await weatherDao.findLatestWeatherByCity('Vladivostok');
    if (weather != null && DateTime.now().difference(weather.dateTime).inMinutes < 10) {
      return weather;
    } else {
      return await updateWeather();
    }
  }

  Future<Weather> updateWeather() async {
    final weather = await ApiService.fetchWeather();
    final database = await databaseProvider.database;
    final weatherDao = database.weatherDao;
    await weatherDao.insertWeather(weather);
    return weather;
  }
}
