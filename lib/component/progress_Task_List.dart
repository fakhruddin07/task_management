import 'package:flutter/material.dart';

import '../api/apiClient.dart';

class ProgressTaskList extends StatefulWidget {
  const ProgressTaskList({super.key});

  @override
  State<ProgressTaskList> createState() => _ProgressTaskList();
}

class _ProgressTaskList extends State<ProgressTaskList> {
  List taskItems = [];
  bool isLoading = true;

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

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : RefreshIndicator(
            onRefresh: () async {
              await callData();
            },
            child: const Center(
              child: Text("Progress"),
            ),
          );
  }
}
