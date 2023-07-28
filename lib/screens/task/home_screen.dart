import 'package:flutter/material.dart';

import '../../component/app_bottom_nav.dart';
import '../../component/cancel_task_list.dart';
import '../../component/completed_task_list.dart';
import '../../component/new_task_list.dart';
import '../../component/progress_task_list.dart';
import '../../component/taskAppBar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int tabIndex = 0;

  onItemTapped(int index){
    setState(() {
      tabIndex = index;
    });
  }
   final List<Widget> _widgetsOption = const [
     NewTaskList(),
     ProgressTaskList(),
     CompletedTaskList(),
     CancelledTaskList(),
   ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: taskAppBar(),
      body: _widgetsOption[tabIndex],
      bottomNavigationBar: appBottomNav(tabIndex, onItemTapped),
    );
  }
}
