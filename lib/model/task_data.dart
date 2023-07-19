import 'package:flutter/material.dart';
import 'package:todoapp/model/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(
      name: 'go to Gym',
    ),
    Task(name: 'Study dart'),
    Task(name: 'Go in Date'),
  ];
  void addTask(String newTaskTitle) {
    tasks.add(Task(name: newTaskTitle));
    notifyListeners();
  }

  void updateTask(Task task) {
    task.isDone=!task.isDone;
    notifyListeners();
  }

  void deleteTask(Task task) {
    tasks.remove(task);
    notifyListeners();
  }
}
