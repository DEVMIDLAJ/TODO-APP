// ignore_for_file: unused_element
import 'package:flutter/material.dart';

class TodoProvider extends ChangeNotifier {
  String selectedIndex = '';
  String get _selectedIndex => selectedIndex;


  set _selectedIndex(String newIndex) {
    selectedIndex = newIndex;
    notifyListeners();
  }


  setCurrentIndex(context,{String index=''}){
    selectedIndex=index;
    notifyListeners();
  }
}
