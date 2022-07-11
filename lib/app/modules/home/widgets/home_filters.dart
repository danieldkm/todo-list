import 'package:flutter/material.dart';
import 'package:flutter_todo_list/app/core/ui/theme_extensions.dart';
import 'package:flutter_todo_list/app/models/task_filter_enum.dart';
import 'package:flutter_todo_list/app/models/total_task_model.dart';
import 'package:flutter_todo_list/app/models/week_task_model.dart';
import 'package:flutter_todo_list/app/modules/home/home_controller.dart';
import 'package:flutter_todo_list/app/modules/home/widgets/todo_card_filter.dart';
import 'package:provider/provider.dart';

class HomeFilters extends StatelessWidget {
  const HomeFilters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'FILTROS',
          style: context.titleStyle,
        ),
        const SizedBox(
          height: 10,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: [
            TodoCardFilter(
              label: 'HOJE',
              taskFilter: TaskFilterEnum.today,
              totalTaskModel: context.select<HomeController, TotalTaskModel?>(
                (controller) => controller.todayTotalTasks,
              ),
              selected: context.select<HomeController, TaskFilterEnum>(
                    (value) => value.filterSelected,
                  ) ==
                  TaskFilterEnum.today,
            ),
            TodoCardFilter(
              label: 'AMANHÃ',
              taskFilter: TaskFilterEnum.tomorrow,
              totalTaskModel: context.select<HomeController, TotalTaskModel?>(
                (controller) => controller.tomorrowTotalTasks,
              ),
              selected: context.select<HomeController, TaskFilterEnum>(
                    (value) => value.filterSelected,
                  ) ==
                  TaskFilterEnum.tomorrow,
            ),
            TodoCardFilter(
              label: 'SEMANA',
              taskFilter: TaskFilterEnum.week,
              totalTaskModel: context.select<HomeController, TotalTaskModel?>(
                (controller) => controller.weekTotalTasks,
              ),
              selected: context.select<HomeController, TaskFilterEnum>(
                    (value) => value.filterSelected,
                  ) ==
                  TaskFilterEnum.week,
            ),
          ]),
        )
      ],
    );
  }
}
