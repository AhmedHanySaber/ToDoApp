import 'package:flutter/material.dart';
import 'package:todoapp/model/data_base.dart';
import 'package:todoapp/model/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];
  List<Task> get tasks => _tasks;
    Future<void> loadTodos() async {
    _tasks = await DatabaseHelper.instance.getTodos();
    notifyListeners();
  }
    Future<void> addTodo(Task task) async {
    await DatabaseHelper.instance.insertTodo(task);
    await loadTodos();
  }
    Future<void> updateTodo(Task task) async {
    await DatabaseHelper.instance.updateTodo(task);
    await loadTodos();
  }

  Future<void> deleteTodo(int id) async {
    await DatabaseHelper.instance.deleteTodo(id);
    await loadTodos();
  }
  // void addTask(String newTaskTitle) {
  //   tasks.add(Task(name: newTaskTitle, id: tasks.length));
  //   notifyListeners();
  // }

  // void updateTask(Task task) {
  //   task.isDone = !task.isDone;
  //   notifyListeners();
  // }

  // void deleteTask(Task task) {
  //   tasks.remove(task);
  //   notifyListeners();
  // }
}
