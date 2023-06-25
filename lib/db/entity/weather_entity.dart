import 'package:floor/floor.dart';

import '../converters/date_time_converter.dart';

@Entity(tableName: 'Weather')
class Weather {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  final String locationName;
  final double temperature;
  final String description;
  final String humidity;
  final String windSpeed;
  final String iconUrl;

  @TypeConverters([DateTimeConverter])
  final DateTime dateTime;

  Weather({
    this.id,
    required this.locationName,
    required this.temperature,
    required this.description,
    required this.humidity,
    required this.windSpeed,
    required this.dateTime,
    required this.iconUrl
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    final weather = json['weather'][0];
    final main = json['main'];
    final iconCode = weather['icon'];
    final iconUrl = 'https://openweathermap.org/img/w/$iconCode.png';
    final temperature = main['temp'].toDouble();
    final description = weather['description'];
    final locationName = json['name'];

    return Weather(
      temperature: temperature,
      description: description,
      humidity: main['humidity'].toString(),
      windSpeed: json['wind']['speed'].toString(),
      dateTime: DateTime.now(),
      locationName: locationName,
      iconUrl: iconUrl,
    );
  }
}