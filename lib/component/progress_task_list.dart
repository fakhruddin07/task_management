import 'package:flutter/material.dart';

import '../api/apiClient.dart';
import '../component/task_list.dart';
import '../style/style.dart';

class ProgressTaskList extends StatefulWidget {
  const ProgressTaskList({super.key});

  @override
  State<ProgressTaskList> createState() => _ProgressTaskList();
}

class _ProgressTaskList extends State<ProgressTaskList> {
  List taskItems = [];
  bool isLoading = true;
  String status = "Progress";

  @override
  initState() {
    callData();
    super.initState();
  }

  callData() async {
    var data = await taskListRequest("Progress");
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

  statusChange(id) async{
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              height: 360,
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RadioListTile(
                    title: const Text("New"),
                    value: "New",
                    groupValue: status,
                    onChanged: (value) {
                      status = value.toString();
                      setState(() {});
                    },
                  ),
                  RadioListTile(
                    title: const Text("Progress"),
                    value: "Progress",
                    groupValue: status,
                    onChanged: (value) {
                      status = value.toString();
                      setState(() {});
                    },
                  ),
                  RadioListTile(
                    title: const Text("Completed"),
                    value: "Completed",
                    groupValue: status,
                    onChanged: (value) {
                      status = value.toString();
                      setState(() {});
                    },
                  ),
                  RadioListTile(
                    title: const Text("Cancelled"),
                    value: "Cancelled",
                    groupValue: status,
                    onChanged: (value) {
                      status = value.toString();
                      setState(() {});
                    },
                  ),
                  SizedBox(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        updateStatus(id);
                      },
                      style: appButtonStyle(),
                      child: successButtonChild("Confirm"),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  updateStatus(id) async{
    setState((){isLoading = true;});
    await taskUpdatedRequest(id,status);
    await callData();
    setState((){
      status = "Progress";
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : RefreshIndicator(
            onRefresh: () async {
              await callData();
            },
            child: taskList(taskItems, deleteItem, statusChange),
          );
  }
}
