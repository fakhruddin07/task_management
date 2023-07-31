import 'package:flutter/material.dart';
import 'package:task_manager/style/style.dart';
import '../../component/task_list.dart';
import '../../api/apiClient.dart';

class NewTaskList extends StatefulWidget {
  const NewTaskList({super.key});

  @override
  State<NewTaskList> createState() => _NewTaskListState();
}

class _NewTaskListState extends State<NewTaskList> {
  List taskItems = [];
  bool isLoading = true;
  String status = "New";

  @override
  initState() {
    callData();
    super.initState();
  }

  callData() async {
    var data = await taskListRequest("New");
    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
    taskItems = data;
  }

  deleteItem(id) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("DELETE"),
          content: const Text("Once you delete it, you can't get it back"),
          actions: [
            OutlinedButton(
              onPressed: () async {
                Navigator.pop(context);
                setState(() {
                  isLoading = true;
                });
                await taskDeleteRequest(id);
                await callData();
              },
              child: const Text("Yes"),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("No"),
            ),
          ],
        );
      },
    );
  }

  statusChange(id) {
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
      status = "New";
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
