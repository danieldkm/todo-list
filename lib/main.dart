import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_list/app/app_module.dart';
import 'package:flutter_todo_list/app/core/database/sqlite_connection_factory.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SqliteConnectionFactory().openConnection();

  runApp(const AppModule());
}
