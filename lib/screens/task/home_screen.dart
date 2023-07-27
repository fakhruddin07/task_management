import 'package:flutter/material.dart';
import '../../component/app_bottom_nav.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int bottomTabIndex = 0;

  onItemTapped(int index){
    setState(() {
      bottomTabIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text("Home Screen"),
      ),
      bottomNavigationBar: appBottomNav(bottomTabIndex, onItemTapped),
    );
  }
}
