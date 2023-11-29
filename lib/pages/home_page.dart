// ignore_for_file: must_be_immutable, avoid_print

import 'package:flutter/material.dart';
import 'package:todo_list_app/models/todo_model.dart';
import 'package:todo_list_app/util.dart';
import 'package:todo_list_app/widgets/display_text.dart';

class HomePage extends StatelessWidget {
   final VoidCallback? updateHomePage;
   HomePage({super.key, todos, this.updateHomePage});

  List<Todo>? todos = [];

  @override
  Widget build(BuildContext context) {
    print("HomeScreen");
    print(todoList);
    updateHomePage;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Search for your task...",
                    prefixIcon: Icon(Icons.search)),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 80,
                height: 35,
                color: Colors.black12,
                child: const Row(
                  children: [
                    Text("   Today"),
                    Icon(
                      Icons.keyboard_arrow_down_outlined,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 2,
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: todoList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 90,
                      width: 350,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.circle_outlined),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(todoList[index].taskName.toString()),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    DisplayText(
                                      text:
                                          "Today At ${todoList[index].dueTime.toString()}",
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 25,
                                      width: 90,
                                      decoration: BoxDecoration(
                                          color: todoList[index]
                                              .selectedCategory
                                              ?.categoryColor,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(todoList[index]
                                              .selectedCategory
                                              ?.categoryIcon),
                                          Text(
                                              '${todoList[index].selectedCategory?.categoryText.toString()}'),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          OutlinedButton.icon(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.flag,
                              size: 10,
                            ),
                            label:
                                Text(todoList[index].selectedItem.toString()),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
