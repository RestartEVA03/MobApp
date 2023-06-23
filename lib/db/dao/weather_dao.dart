import 'package:floor/floor.dart';
import '../entity/weather_entity.dart'; // Replace with your actual package name

@dao
abstract class WeatherDao {
  @Query('SELECT * FROM Weather WHERE locationName = :locationName ORDER BY dateTime DESC LIMIT 1')
  Future<Weather?> findLatestWeatherByCity(String locationName);

  @insert
  Future<void> insertWeather(Weather weather);
}