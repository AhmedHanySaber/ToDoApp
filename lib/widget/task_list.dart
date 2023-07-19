import 'package:flutter/material.dart';
import 'package:todoapp/model/task_data.dart';
import 'package:todoapp/widget/tasks_list.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
            itemCount: taskData.tasks.length,
            itemBuilder: (context, index) {
              return TaskTile(
                  listTileDelete: () {
                    taskData.deleteTask(taskData.tasks[index]);
                  },
                  taskName: taskData.tasks[index].name,
                  isChecked: taskData.tasks[index].isDone,
                  checkBoxChange: (newValue) {
                    taskData.updateTask(taskData.tasks[index]);
                  });
            });
      },
    );
  }
}
//
