import 'package:flutter/material.dart';
import 'package:flutter_todo_list/app/core/ui/theme_extensions.dart';

class CalendarButton extends StatelessWidget {
  const CalendarButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.today, color: Colors.grey),
          const SizedBox(height: 10),
          Text(
            'SELECIONE UMA DATA',
            style: context.titleStyle,
          ),
        ],
      ),
    );
  }
}
