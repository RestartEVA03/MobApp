import 'package:floor/floor.dart';


@Entity(tableName: 'Questions')
class QuestionEntity {
  @PrimaryKey(autoGenerate: true)
  final int id;
  final String title;
  final List<Map<String, dynamic>> answers;

  QuestionEntity({
    required this.id,
    required this.title,
    required this.answers,
  });
}