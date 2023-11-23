// ignore_for_file: avoid_print, unused_field, prefer_const_constructors

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
  Color selectedColor = Colors.blue;

  List<Todo> todos = [];

  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  int _cIndex = 0;

  @override
  Widget build(BuildContext context) {
    print("mainPage");
    return Scaffold(
      appBar: AppBar(
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
        index: _cIndex,
        children: [
           HomePage(),
           CalendarScreen(),
           FocusePage(),
           profilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
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
              label: "Focuce"),
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

  //boottomsheet updation while a value is returing from the bottom sheet page
  void _updateModelSheet() {
    setState(() {});
  }

  ///bottomnavigation screen changer
  void onItemTapped(index) {
    setState(() {
      _cIndex = index;
    });
  }
}
