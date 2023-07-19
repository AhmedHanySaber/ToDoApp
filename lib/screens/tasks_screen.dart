import 'package:flutter/material.dart';
import 'package:todoapp/screens/add_screen.dart';
import 'package:todoapp/widget/task_list.dart';
import 'package:provider/provider.dart';

import '../model/task_data.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddScreen(
                  addTaskcallBackFunction: (newTaskTitle) {
                    if (newTaskTitle != null) {
                      //
                      // setState(() {
                      //   tasks.add(Task(name: newTaskTitle));
                      //
                      // });
                    }
                  },
                ),
              ),
            ),
          );
        },
        backgroundColor: Colors.indigo[400],
        child: const Icon(Icons.add),
      ),
      backgroundColor: Colors.teal[400],
      body: Container(
        padding: const EdgeInsets.only(
          top: 60,
          left: 20,
          right: 20,
          bottom: 80,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(
                  Icons.playlist_add_check,
                  size: 40,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'ToDayDo',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
             Text(
              '${Provider.of<TaskData>(context).tasks.length} Tasks',
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: const TaskList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
