import 'package:flutter/material.dart';

import '../api/apiClient.dart';
import '../component/task_list.dart';

class CompletedTaskList extends StatefulWidget {
  const CompletedTaskList({super.key});

  @override
  State<CompletedTaskList> createState() => _CompletedTaskListState();
}

class _CompletedTaskListState extends State<CompletedTaskList> {
  List taskItems = [];
  bool isLoading = true;

  @override
  initState() {
    callData();
    super.initState();
  }

  callData() async {
    var data = await taskListRequest("Completed");
    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
    taskItems = data;
  }

  deleteItem(id) async{
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: const Text("DELETE"),
        content: const Text("Once you delete it, you can't get it back"),
        actions: [
          OutlinedButton(onPressed: () async {
            Navigator.pop(context);
            setState(() {
              isLoading = true;
            });
            await taskDeleteRequest(id);
            await callData();
          }, child: const  Text("Yes"),),
          OutlinedButton(onPressed: (){
            Navigator.pop(context);
          }, child: const  Text("No"),),
        ],
      );
    },);
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : RefreshIndicator(
            onRefresh: () async {
              await callData();
            },
            child: taskList(taskItems, deleteItem),
          );
  }
}
