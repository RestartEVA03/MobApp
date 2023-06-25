import 'package:floor/floor.dart';

import '../entity/question_entity.dart';

@dao
abstract class QuestionDao {
  @Query('SELECT * FROM Questions')
  Future<List<QuestionEntity>> getAllQuestions();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertAllQuestions(List<QuestionEntity> questions);
}