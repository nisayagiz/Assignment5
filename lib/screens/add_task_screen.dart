import 'package:flutter/material.dart';
import 'package:todo_app/models/task_item.dart';
import 'package:todo_app/models/task_repository.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'dart:async';

class AddTaskScreen extends StatelessWidget {
  String taskTitle;
  @override
  Widget build(BuildContext context) {
    
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          color: Colors.white,
          child: Column(
            children: [
              Text(
                'Add task',
                textAlign: TextAlign.center ,
                style: TextStyle(
                  color: Colors.lightGreen,
                  fontSize: 25,
                ),
              ),
              SizedBox(height: 15,),
              TextField(
                onChanged: (newText) {
                  print (newText);
                  taskTitle = newText;
                },
                autofocus: true,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.lightGreen, fontSize: 20),
              ),
              SizedBox(height: 10),
              FlatButton(
                  onPressed: () {
                    if(taskTitle != null) {
                      Provider.of<TaskRepository>(context, listen: false).
                        addTask(TaskItem(title: taskTitle, isDone: false));

                    }
                    Navigator.of(context).pop();
                  },
                  child: Text('Add',
                  style: TextStyle(color: Colors.white),
                  ),
              color: Colors.lightGreen
              )
            ],
          )
        ),
      ),
    );
  }
}
