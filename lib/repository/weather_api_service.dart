import 'package:http/http.dart' as http;
import 'dart:convert';

import '../api_constants.dart';
import '../db/entity/weather_entity.dart';

class ApiService {
  static Future<Weather> fetchWeather() async {
    final Uri uri = Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?q=$city&units=metric&appid=$weatherApiKey'
    );
    final response = await http.get(uri);
    final results = jsonDecode(response.body);

    final weather = Weather.fromJson(results);

    return weather;
  }
}