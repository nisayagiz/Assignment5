import 'package:flutter/cupertino.dart';
import 'package:todo_app/models/task_item.dart';
import 'package:localstorage/localstorage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';


class TaskRepository extends ChangeNotifier{
  final LocalStorage storage = new LocalStorage('todo_app');
  final TaskList list = new TaskList();
  bool initialized = false;
  TextEditingController controller = new TextEditingController();

  List<TaskItem> tasks=[];

  TaskRepository() {
    var items = storage.getItem('todos');
    addTask(TaskItem(title: 'Hocam hot restart etmenize gerek yok yapamdım ben :(', isDone: false));
    //addTask(TaskItem(title: 'Study Flutter', isDone: false));
  }

  _saveToStorage() {
    storage.setItem('todos', list.toJSONEncodable());
  }

  _clearStorage() async {
    await storage.clear();
    notifyListeners();
  }

  int taskCount() {
    return tasks.length;
  }

  void addTask(TaskItem task) {
    tasks.add(task);
    notifyListeners();
    _saveToStorage();
  }

  void toggleTask (TaskItem task) {
    task.isDone = !task.isDone;
    notifyListeners();
    _saveToStorage();
  }

  int incompleteTaskCount() {
    return tasks.where((t) => !t.isDone).length;
  }

  void deleteTask(TaskItem task) {
    tasks.remove(task);
    notifyListeners();
    _saveToStorage();
  }
}


class Storage {

  Future<String> get localPath async {
    final dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }

  Future<File> get localFile async {
    final path = await localPath;
    return File('$path/db.txt');
  }

  Future<String> readData() async {
    try {
      final file = await localFile;
      String body = await file.readAsString();
      return body;
    } catch (e) {
      return e.toString();
    }
  }

  /*Future<File> writeData(String data) {
    final file = await localFile;
    return file.writeAsString('$data');
  }

   */
}