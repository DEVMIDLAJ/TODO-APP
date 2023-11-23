// ignore_for_file: avoid_print, unrelated_type_equality_checks, unused_local_variable, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/domain/provider.dart';
import 'package:todo_list_app/widgets/custom_elevatedbutton.dart.dart';
import 'package:todo_list_app/widgets/display_text.dart';

class TaskSelectionScreen extends StatefulWidget {
  const TaskSelectionScreen({super.key, required this.selectedIndex});
  final String selectedIndex;

  @override
  State<TaskSelectionScreen> createState() => _TaskSelectionScreenState();
}

class _TaskSelectionScreenState extends State<TaskSelectionScreen> {
  // String? selectedIndex;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final todoProvider = context.watch<TodoProvider>();
    return Scaffold(
      body: Center(
        child: Consumer<TodoProvider>(
          builder: (context,data,_) {
            return Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(10),
              height: 500,
              width: 500,
              color: Colors.white10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
                children: [
                  const DisplayText(
                    text: "Task Priority",
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          // setState(() {
                          //   selectedIndex = '${index + 1}'.toString();
                          // });
                          // Provider.of<TodoProvider>(context, listen: false)
                          //     .selectedIndex = '${index + 1}'.toString();
                          // todoProvider.selectedIndex='${index + 1}'.toString();
                          data.setCurrentIndex(context,index:'${index + 1}'.toString() );
                        },
                        child: Container(
                          height: 64,
                          width: 64,
                          decoration: BoxDecoration(
                            color:data.selectedIndex=='${index+1}'.toString()
                                // Provider.of<TodoProvider>(context, listen: false).selectedIndex =='${index + 1}'
                                // selectedIndex == '${index + 1}'.toString()
                                ? Colors.blue
                                : Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.flag),
                                DisplayText(
                                    text: "${index + 1}",
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //cancel
                      SizedBox(
                        height: 50,
                        width: 140,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.white,
                            side: const BorderSide(
                              color: Color.fromARGB(255, 167, 63, 153),
                              width: 3,
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("Cancel"),
                        ),
                      ),
                      //save button
                      CustomElevatedButton(
                          ButtonHight: 50,
                          BottonWidth: 140,
                          Buttonaction: () {
                           // Navigator.of(context).pop(todoProvider.selectedIndex);
                           Navigator.of(context).pop();
                          },
                          ButtonText: "Save"),
                    ],
                  )
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
