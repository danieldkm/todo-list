import 'package:flutter_todo_list/app/core/modules/todo_list_module.dart';
import 'package:flutter_todo_list/app/modules/tasks/task_create_controller.dart';
import 'package:flutter_todo_list/app/modules/tasks/task_create_page.dart';
import 'package:provider/provider.dart';

class TasksModule extends TodoListModule {
  TasksModule()
      : super(
          bindings: [
            ChangeNotifierProvider(
              create: (context) => TaskCreateController(),
            ),
          ],
          routers: {
            '/task/create': (context) => TaskCreatePage(
                  controller: context.read(),
                ),
          },
        );
}
