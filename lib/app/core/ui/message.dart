import 'package:flutter/material.dart';
import 'package:flutter_todo_list/app/core/ui/theme_extensions.dart';

class Message {
  final BuildContext context;

  Message._(this.context);

  factory Message.of(BuildContext context) {
    return Message._(context);
  }

  void showError(String message) => _showMessage(message, Colors.red);
  void showInfo(String message) => _showMessage(message, context.primaryColor);

  void _showMessage(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }
}
