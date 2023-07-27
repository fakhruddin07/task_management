import 'package:flutter/material.dart';

import '../api/apiClient.dart';
import '../component/task_list.dart';

class CancelledTaskList extends StatefulWidget {
  const CancelledTaskList({super.key});

  @override
  State<CancelledTaskList> createState() => _CancelledTaskListState();
}

class _CancelledTaskListState extends State<CancelledTaskList> {
  List taskItems = [];
  bool isLoading = true;

  @override
  initState() {
    callData();
    super.initState();
  }

  callData() async {
    var data = await taskListRequest("Cancelled");
    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
    taskItems = data;
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : RefreshIndicator(
            onRefresh: () async {
              await callData();
            },
            child: taskList(taskItems),
          );
  }
}
