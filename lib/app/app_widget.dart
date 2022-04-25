import 'package:flutter/material.dart';
import 'package:flutter_todo_list/app/core/navidator/todo_list_navigator.dart';
import 'package:flutter_todo_list/app/core/ui/todo_list_ui_config.dart';
import 'package:flutter_todo_list/app/modules/auth/auth_module.dart';
import 'package:flutter_todo_list/app/modules/home/home_module.dart';
import 'package:flutter_todo_list/app/modules/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List Provider',
      initialRoute: '/login',
      theme: TodoListUiConfig.theme,
      navigatorKey: TodoListNavigator.navigatorKey,
      routes: {
        ...AuthModule().routers,
        ...HomeModule().routers,
      },
      home: const SplashPage(),
    );
  }
}
