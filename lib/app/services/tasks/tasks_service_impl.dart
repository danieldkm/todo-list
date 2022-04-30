import 'package:flutter_todo_list/app/repositories/task/tasks_repository.dart';
import 'package:flutter_todo_list/app/services/tasks/tasks_service.dart';

class TasksServiceImpl implements TasksService {
  final TasksRepository _tasksRepository;

  TasksServiceImpl({
    required TasksRepository tasksRepository,
  }) : _tasksRepository = tasksRepository;

  @override
  Future<void> save(DateTime date, String description) =>
      _tasksRepository.save(date, description);
}
