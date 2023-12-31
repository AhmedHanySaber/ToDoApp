import 'package:flutter/material.dart';
import 'package:todoapp/screens/tasks_screen.dart';
import 'package:provider/provider.dart';

import 'model/task_data.dart';
void main() {
  runApp(const MyApp());
}
//try
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>TaskData(),
      child: const MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}
