import 'package:flutter/material.dart';
import 'package:todoapp/model/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile(
      {super.key,
      required this.taskName,
      this.isChecked = false,
      required this.checkBoxChange,
      required this.listTileDelete});

  final String taskName;
  final bool isChecked;
  final void Function(bool?) checkBoxChange;
  final void Function() listTileDelete;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          taskName,
          style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Checkbox(
          value: isChecked,
          onChanged: checkBoxChange,
        ),
        onLongPress: listTileDelete,
    );
  }
}

