import 'package:flutter/material.dart';

import '../../component/app_bottom_nav.dart';
import '../../component/cancel_task_list.dart';
import '../../component/completed_task_list.dart';
import '../../component/new_task_list.dart';
import '../../component/progress_task_list.dart';
import '../../component/task_app_bar.dart';
import '../../utility/utility.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int tabIndex = 0;
  Map<String, String> profileData = {
    "email": "aa",
    "firstName": "aa",
    "lastName": "aa",
    "photo": defaultProfileImage,
  };

  onItemTapped(int index) {
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

  readAppBarData() async {
    String? email = await readUserData("email");
    String? firstName = await readUserData("firstName");
    String? lastName = await readUserData("lastName");
    String? photo = await readUserData("photo");

    setState(() {
      profileData = {
        "email": "$email",
        "firstName": "$firstName",
        "lastName": "$lastName",
        "photo": "$photo",
      };
    });
  }

  @override
  void initState() {
    readAppBarData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: taskAppBar(context, profileData),
      body: _widgetsOption[tabIndex],
      bottomNavigationBar: appBottomNav(tabIndex, onItemTapped),
    );
  }
}
