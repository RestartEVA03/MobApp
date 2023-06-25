import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../models/Question.dart';
import 'converters/question_converter.dart';
import 'dao/question_dao.dart';
import 'converters/date_time_converter.dart';
import 'dao/weather_dao.dart';
import 'entity/question_entity.dart';
import 'entity/weather_entity.dart';

part 'app_database.g.dart';

@Database(version: 2, entities: [Weather, QuestionEntity])
@TypeConverters([QuestionConverter])

abstract class AppDatabase extends FloorDatabase {
  WeatherDao get weatherDao;
  QuestionDao get questionDao;
}


