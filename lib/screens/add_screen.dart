import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/model/task.dart';

import '../model/task_data.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({
    super.key,
    required this.addTaskcallBackFunction,
  });
  final void Function(String?) addTaskcallBackFunction;
  @override
  Widget build(BuildContext context) {
    Task? task;
    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                color: Colors.indigo[400],
                fontWeight: FontWeight.bold,
              )),
          TextFormField(
            textAlign: TextAlign.center,
            autofocus: true,
            onChanged: (newText) {
              task = Task(name: newText,id: generateUniqueId() );
            },
          ),
          const SizedBox(height: 30),
          TextButton(
            child:Text('Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )
              )
              ,
            onPressed: () {
                  // ignore: unnecessary_null_comparison
                    if (task != null) {
                    Provider.of<TaskData>(context, listen: false).addTodo(task!);
                  }
                  Navigator.pop(context);
                  },
          )
        ],
      ),
    );
  }
}
int generateUniqueId() {
  Random random = Random();
  DateTime now = DateTime.now();
  int uniqueId = now.microsecondsSinceEpoch + random.nextInt(9999);
  return uniqueId;
}