import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_repository.dart';
import 'package:todo_app/screens/main_screen.dart';
import 'dart:io';
import 'dart:async';
import 'package:flutter/foundation.dart';


void main() {
  runApp(
    ChangeNotifierProvider<TaskRepository> (
        create: (context) => TaskRepository(),
      child: MaterialApp(
        home: MainScreen(
          //storage: Storage(),
        ),
      ),
    )
  );
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