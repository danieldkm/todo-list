import 'package:flutter_todo_list/app/core/modules/todo_list_module.dart';
import 'package:flutter_todo_list/app/modules/tasks/task_create_controller.dart';
import 'package:flutter_todo_list/app/modules/tasks/task_create_page.dart';
import 'package:flutter_todo_list/app/repositories/task/tasks_repository.dart';
import 'package:flutter_todo_list/app/repositories/task/tasks_repository_impl.dart';
import 'package:flutter_todo_list/app/services/tasks/tasks_service.dart';
import 'package:flutter_todo_list/app/services/tasks/tasks_service_impl.dart';
import 'package:provider/provider.dart';

class TasksModule extends TodoListModule {
  TasksModule()
      : super(
          bindings: [
            Provider<TasksRepository>(
              create: (context) => TasksRepositoryImpl(
                sqliteConnectionFactory: context.read(),
              ),
            ),
            Provider<TasksService>(
              create: (context) => TasksServiceImpl(
                tasksRepository: context.read(),
              ),
            ),
            ChangeNotifierProvider(
              create: (context) => TaskCreateController(
                tasksService: context.read(),
              ),
            ),
          ],
          routers: {
            '/task/create': (context) => TaskCreatePage(
                  controller: context.read(),
                ),
          },
        );
}
