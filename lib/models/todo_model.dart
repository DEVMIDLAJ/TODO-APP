import 'package:flutter/material.dart';

class Todo {
  final String? taskName;
  final String? discription;
  final String? dueTime;
  final String? dueDate;
  final Category? selectedCategory;
  final String? selectedItem;
  final bool? complited;

  Todo({
    required this.taskName,
    required this.discription,
    required this.dueDate,
    required this.dueTime,
    required this.selectedCategory,
    required this.selectedItem,
    required this.complited, });
}

class Category {
  final Color? categoryColor;
  final IconData? categoryIcon;
  final String? categoryText;


  Category({
    required this.categoryColor,
    required this.categoryIcon,
    required this.categoryText,
  });
}
