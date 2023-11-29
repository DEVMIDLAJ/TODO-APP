// ignore_for_file: avoid_print, unnecessary_null_comparison, avoid_returning_null_for_void, use_build_context_synchronously, unused_local_variable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:todo_list_app/models/todo_model.dart';

class Functions {
  // Variable for category list (Consider defining its type)
  var categoryList;
  // Variable for selected category index (Consider defining its type)
  var isSelected;

  // Date picker function
  static Future<String?> pickUserDueDate(BuildContext context) async {
    print("datePicker function");
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022, 1),
      lastDate: DateTime(2023, 12),
    );
    if (picked != null) {
      // Handle the selected date as needed
      print('Selected Date: $picked');
    }
    return "$picked";
  }

  // Time picker function
  static Future<String?> pickUserDueTime(BuildContext context) async {
    print("timePicker function");
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      print('Selected Time: $picked');
    }
    return "${picked?.format(context)}";
  }

  // Category selection function
  Future<Category> handleCategorySelected(
      BuildContext context, Category selected) async {
    print("category selection function");

    if (isSelected == 0 && isSelected < categoryList.length) {
      // Redundant assignment; isSelected is already declared
      Category selected = categoryList[isSelected];
    }
    print("Selected Category: ${selected.categoryText}");
    print("Selected Category Color: ${selected.categoryColor}");
    return selected;
  }
}
