import 'package:flutter/material.dart';
import 'package:task_manager/style/style.dart';

BottomNavigationBar appBottomNav(currentIndex, onItemTapped) {
  return BottomNavigationBar(
    selectedItemColor: colorGreen,
    unselectedItemColor: colorLightGray,
    showUnselectedLabels: true,
    currentIndex: currentIndex,
    type: BottomNavigationBarType.fixed,
    onTap: onItemTapped,
    items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.list_alt),
        label: "New",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.list_alt),
        label: "In Progress",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.list_alt),
        label: "Completed",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.list_alt),
        label: "Cancelled",
      ),
    ],
  );
}
