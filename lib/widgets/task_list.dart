import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/task_repository.dart';
import 'task_tile.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';

class TaskList extends StatelessWidget {
  /*final Storage = storage;

  MainScreen({Key key, @required this.storage}) : super(key: key);
  @override
  _MainScreenState createState() => _MainScreenState();
}
  const TaskList({
    this.storage;
    Key key,
  }) : super(key: key);

   */

  @override
  Widget build(BuildContext context) {
    TaskRepository taskRepository = Provider.of<TaskRepository>(context);

    return ListView.builder(
      itemCount: taskRepository.taskCount(),
      itemBuilder: (context, index) {
        var task = taskRepository.tasks[index];

        return TaskTile(
          title: task.title,
          isDone: task.isDone,
          onCheckBoxClicked: (value) {
            taskRepository.toggleTask(task);
          },
          onLongPressed: () async {
            await showCupertinoDialog(
                context: context,
                builder: (context) => CupertinoAlertDialog(
                  title: Text('Confirmation'),
                  content: Text('Are you sure you want to delete ${task.title}?\nThis action is irreversible.'),
                  actions: [
                    CupertinoDialogAction(
                      child: Text('Yes'),
                      onPressed:() {
                        taskRepository.deleteTask(task);
                        Navigator.of(context).pop();
                      },
                    ),
                    CupertinoDialogAction(child: Text('No'),
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
            );
          },
        );
      },
    );
  }
}
