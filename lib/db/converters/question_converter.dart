import 'dart:convert';

import 'package:floor/floor.dart';

class QuestionConverter extends TypeConverter<List<Map<String, dynamic>>, String> {
  @override
  List<Map<String, dynamic>> decode(String databaseValue) {
    final List<dynamic> decodedList = jsonDecode(databaseValue);
    return decodedList.map((dynamic item) => item as Map<String, dynamic>).toList();
  }

  @override
  String encode(List<Map<String, dynamic>> value) {
    final List<dynamic> encodedList = value.map((Map<String, dynamic> item) => item as dynamic).toList();
    return jsonEncode(encodedList);
  }
}
