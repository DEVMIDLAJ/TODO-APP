// ignore_for_file: unused_field, avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todo_list_app/pages/calendar_page.dart';
import 'package:todo_list_app/pages/focuse_page.dart';
import 'package:todo_list_app/pages/profile_page.dart';
import 'package:todo_list_app/pages/home_page.dart';
import 'package:todo_list_app/models/todo_model.dart';
import 'package:todo_list_app/widgets/my_floting_action_button.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  // Color variable for tracking the selected color
  Color selectedColor = Colors.blue;

  // List to hold Todo items
  List<Todo> todos = [];

  // TabController for handling tab changes
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  // Index for controlling the IndexedStack and BottomNavigationBar
  int _cIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Print statement for debugging or logging purposes
    print("mainPage");

    return Scaffold(
      appBar: AppBar(
        // AppBar with a leading filter icon, title, and user avatar
        leading: IconButton(
          icon: const Icon(
            Icons.filter_list,
          ),
          onPressed: () {},
        ),
        title: const Text("Index"),
        actions: const [
          Padding(
            padding: EdgeInsets.all(10),
            child: CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: IndexedStack(
        // IndexedStack to display the appropriate page based on the index
        index: _cIndex,
        children: [
          HomePage(),
           CalendarPge(),
           FocusePage(),
           profilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        // BottomNavigationBar for navigation between different pages
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        onTap: onItemTapped,
        currentIndex: _cIndex,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.other_houses,
                color: Colors.grey,
              ),
              label: "Index"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_month,
                color: Colors.grey,
              ),
              label: "Calendar"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.access_time,
                color: Colors.grey,
              ),
              label: "Focus"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline_outlined,
                color: Colors.grey,
              ),
              label: "Profile"),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: MyFloatingActionButton(
        context: context,
        updateModelSheet: _updateModelSheet,
      ),
    );
  }

  // Method to update the model sheet based on the bottom sheet result
  void _updateModelSheet() {
    setState(() {});
  }

  // Method to handle bottom navigation item tap and switch between pages
  void onItemTapped(index) {
    setState(() {
      _cIndex = index;
    });
  }
}
