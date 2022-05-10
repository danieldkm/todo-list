import 'package:flutter/material.dart';
import 'package:flutter_todo_list/app/core/notifier/default_change_notifier.dart';
import 'package:flutter_todo_list/app/models/task_filter_enum.dart';

class HomeController extends DefaultChangeNotifier {
  TaskFilterEnum filterSelected = TaskFilterEnum.today;
}
