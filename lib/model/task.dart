import 'dart:math';

import 'package:uuid/uuid.dart';

class Task {
  final String name;
  bool isDone;
  int id;
  Task({required this.name, this.isDone = false,  required this.id});
  void doneChange(isDone) {
    isDone = !isDone;
  }
}
