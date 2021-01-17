import 'package:flutter/material.dart';
import 'package:todo_app/models/task_repository.dart';
import 'package:todo_app/screens/add_task_screen.dart';
import '../widgets/task_list.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'dart:async';
import 'package:flutter/foundation.dart';

class MainScreen extends StatefulWidget {
  bool initialized = false;
  /*final Storage = storage;

  MainScreen({Key key, @required this.storage}) : super(key: key);

   */

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  /*TextEditingController controller = TextEditingController();
  String state;
  Future<Directory> _appDocDir;

  @override
  void initState() {
    super.initState();
    widget.storage.readData().then((String value ) {
      setState(() {
        state = value;
      });
    });
  }

  Future<File> writeData() async {
    setState(() {
      state = controller.text;
      controller.text = '';
    });
    return widget.storage.writeDate(state);
  }


   */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.only(
                  top: 60, bottom: 30, left: 30, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.list,
                        size: 30,
                        color: Colors.lightGreen,
                      )
                  ),
                  SizedBox(height: 10),
                  Text(
                      'CET TODO',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3.0,
                        color: Colors.white,
                      )
                  ),
                  Text(
                      '${Provider.of<TaskRepository>(context)
                          .taskCount()} Tasks '
                          '(${Provider.of<TaskRepository>(context)
                          .incompleteTaskCount()} complete)',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )
                  ),
                ],
              )
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)
                ),
                color: Colors.white,
              ),
              child: TaskList(),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightGreen,
        child: Icon(Icons.add),
        onPressed: () {
          //writeData();
          print('floating action button pressed');
          showModalBottomSheet(
            context: context,
            builder: (context) => AddTaskScreen(),
          );
        },
      ),

    );
  }
}

