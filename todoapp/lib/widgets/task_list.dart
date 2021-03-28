import 'package:flutter/material.dart';
import 'package:todoapp/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/models/store.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Store>(
      builder: (context, store, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = store.tasks[index];
            return TaskTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              checkboxCallback: (checkboxState) {
                store.updateTask(task);
              },
              longPressCallback: () {
                store.deleteTask(task);
              },
            );
          },
          itemCount: store.taskCount,
        );
      },
    );
  }
}
