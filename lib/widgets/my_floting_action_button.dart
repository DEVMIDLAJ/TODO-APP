// ignore_for_file: avoid_returning_null_for_void, unnecessary_null_comparison, avoid_print, unused_element, unused_local_variable, prefer_final_fields, must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:todo_list_app/domain/functions.dart';
import 'package:todo_list_app/pages/caregory_selection_page.dart';
import 'package:todo_list_app/pages/task_selection_page.dart';
import 'package:todo_list_app/todo_model.dart';
import 'package:todo_list_app/util.dart';
import 'package:todo_list_app/widgets/display_text.dart';

class MyFloatingActionButton extends StatelessWidget {
  //parameter for updating return value to the main page
  final Function updateModelSheet;
  MyFloatingActionButton({super.key, 
  context, required this.updateModelSheet
  });

  final taskController = TextEditingController();

  final discriptionController = TextEditingController();

  String? selectedDate;

  String? selectedTime;

  Category? selectedCategoryInstance;

  String? selectedTaskInstance;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      tooltip: "Add a Todo",
      backgroundColor: Colors.purple,
      child: const Icon(
        Icons.add,
      ),
      onPressed: () async {
        print("show model bottom sheet opened");
        // showmodel bottom sheet
        Todo? addedTodo = await showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: SizedBox(
                    height: 290,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //text Add task
                        const DisplayText(
                          text: "Add Task",
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        //Task added textformfield
                        TextField(
                          controller: taskController,
                          decoration: const InputDecoration(
                            hintText: "Taskname",
                            border: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 3,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          onTap: () {
                            if (taskController.text == null ||
                                taskController.text.isEmpty) {
                              print("Please Enter UserName");
                            } else {
                              return null;
                            }
                          },
                          autofocus: true,
                        ),
                        const SizedBox(
                          height: 15,
                        ),

                        // task added textfield
                        TextField(
                          controller: discriptionController,
                          maxLines: 3,
                          decoration: const InputDecoration(
                            hintText: "Discription Name",
                            border: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 3,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          onTap: () {
                            if (discriptionController.text == null ||
                                discriptionController.text.isEmpty) {
                              print("Please Enter discription");
                            } else {
                              return null;
                            }
                          },
                          autofocus: true,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            //date and time icon
                            IconButton(
                              onPressed: () async {
                                // datePicker
                                String? pickedDate =
                                    await Functions.pickUserDueDate(context);
                                selectedDate = pickedDate;
                                //timepicker
                                String? pickedTime =
                                    await Functions.pickUserDueTime(context);
                                selectedTime = pickedTime;
                              },
                              icon: const Icon(Icons.timer),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            //category selection icon
                            IconButton(
                              onPressed: () async {
                                print("categoryicon button selected");
                                Category? selectedCategory =
                                    await Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return CategorySelection(
                                        selectedCategory:
                                            selectedCategoryInstance = Category(
                                          categoryColor:
                                              selectedCategoryInstance
                                                  ?.categoryColor,
                                          categoryIcon: selectedCategoryInstance
                                              ?.categoryIcon,
                                          categoryText: selectedCategoryInstance
                                              ?.categoryText,
                                        ),
                                      );
                                    },
                                  ),
                                );
                                print(selectedCategoryInstance.toString());
                                selectedCategoryInstance = selectedCategory;
                              },
                              icon: const Icon(Icons.sell),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            // task selection icon
                            IconButton(
                              onPressed: () async {
                                String? selectedIndex =
                                    await Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => TaskSelectionScreen(
                                      selectedIndex:
                                          selectedTaskInstance.toString(),
                                    ),
                                  ),
                                );
                                print(selectedIndex);
                                selectedTaskInstance = selectedIndex;
                                // print('selectedIndex {$selectedTaskInstance+1}'
                                //  .toString());
                              },
                              icon: const Icon(Icons.flag),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                Todo newTask = Todo(
                                  taskName: taskController.text,
                                  discription: discriptionController.text,
                                  dueDate: selectedDate,
                                  dueTime: selectedTime,
                                  selectedCategory: selectedCategoryInstance,
                                  selectedItem: selectedTaskInstance,
                                  complited: false,
                                );
                                Navigator.of(context).pop(newTask);

                              //  updateModelSheet();
                                taskController.clear();
                                discriptionController.clear();
                                selectedTime = null;
                              },
                              icon: const Icon(
                                Icons.send,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            });
        if (addedTodo != null) {
          todoList.add(addedTodo);
        }
      },
    );
  }
}
