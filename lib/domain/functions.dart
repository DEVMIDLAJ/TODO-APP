// ignore_for_file: avoid_print, unnecessary_null_comparison, avoid_returning_null_for_void, use_build_context_synchronously, unused_local_variable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:todo_list_app/todo_model.dart';

class Functions {
  var categoryList;
  var isSelected;

//Date picker
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

//Time picker
  static Future<String?> pickUserDueTime(
    BuildContext context,
  ) async {
    print("timePicker function");
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      print('selected time$picked');
    }
    return "${picked?.format(context)}";
  }

//category selecton function
  Future<Category> handleCategorySelected(
      BuildContext context, Category selected) async {
    print("category selection function");

    if (isSelected == 0 && isSelected < categoryList.length) {
      Category selected = categoryList[isSelected];
    }
    print("Selected Category: ${selected.categoryText}");
    print("Selected Category Color: ${selected.categoryColor}");
    return
     selected;
  }
}
