import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

class TaskTile extends StatelessWidget {
  final String title;
  final bool isDone;
  final Function onCheckBoxClicked;
  final Function onLongPressed;
  final LocalStorage storage;
  final bool initialized;
  final TextEditingController controller;

  const TaskTile({
    this.title,
    this.isDone,
    this.onCheckBoxClicked,
    this.onLongPressed,
    this.initialized,
    this.controller,
    this.storage,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    new LocalStorage('todo_app');
    bool initialized = false;

    return ListTile(
      onLongPress: onLongPressed,
      title: Text(
        this.title,
        style: TextStyle(
          color: Colors.lightGreen,
          decoration: isDone ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        value: isDone,
        activeColor: Colors.lightGreen,
        onChanged: onCheckBoxClicked,
      ),
    );
  }
}
