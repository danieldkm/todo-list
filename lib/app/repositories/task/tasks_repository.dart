import 'package:flutter_todo_list/app/models/task_model.dart';

abstract class TasksRepository {
  Future<void> save(DateTime date, String description);
  Future<List<TaskModel>> findByPerido(DateTime start, DateTime end);
}
