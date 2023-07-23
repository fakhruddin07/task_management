import 'package:flutter/material.dart';

class NewTaskList extends StatefulWidget {
  const NewTaskList({super.key});

  @override
  State<NewTaskList> createState() => _NewTaskListState();
}

class _NewTaskListState extends State<NewTaskList> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("New Task List Screen"),
      ),
    );
  }
}
