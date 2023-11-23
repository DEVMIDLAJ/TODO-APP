// ignore_for_file: prefer_const_constructors_in_immutables, avoid_print, prefer_typing_uninitialized_variables, unused_local_variable, unnecessary_cast, must_be_immutable

import 'package:flutter/material.dart';
import 'package:todo_list_app/domain/functions.dart';
import 'package:todo_list_app/models/todo_model.dart';
import 'package:todo_list_app/widgets/custom_elevatedbutton.dart.dart';
import 'package:todo_list_app/widgets/display_text.dart';

class CategorySelection extends StatelessWidget {
  final Category selectedCategory;

  CategorySelection({
    super.key,
    required this.selectedCategory,
  });

  Category? selected;

  List<Category> categoryList = [
    Category(
        categoryColor: Colors.amber,
        categoryIcon: Icons.radar_outlined,
        categoryText: "Geocery"),
    Category(
        categoryColor: Colors.green,
        categoryIcon: Icons.home_repair_service,
        categoryText: "Work"),
    Category(
        categoryColor: Colors.lightGreen,
        categoryIcon: Icons.fitness_center,
        categoryText: "Sports"),
    Category(
        categoryColor: Colors.blue,
        categoryIcon: Icons.badge,
        categoryText: "Design"),
    Category(
        categoryColor: Colors.orange,
        categoryIcon: Icons.home_work_outlined,
        categoryText: "University"),
    Category(
        categoryColor: Colors.pink,
        categoryIcon: Icons.volume_down,
        categoryText: "Social"),
    Category(
        categoryColor: Colors.pinkAccent,
        categoryIcon: Icons.music_note_outlined,
        categoryText: "Music"),
    Category(
        categoryColor: Colors.yellow,
        categoryIcon: Icons.heart_broken,
        categoryText: "Health"),
    Category(
        categoryColor: Colors.green,
        categoryIcon: Icons.video_camera_back_sharp,
        categoryText: "Movie"),
    Category(
        categoryColor: Colors.orange,
        categoryIcon: Icons.home,
        categoryText: "Home"),
  ];

  @override
  Widget build(BuildContext context) {
        Size size = MediaQuery.of(context).size;

    print("Category screen");
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(10),
          height: size.height*2,
          width: 600,
          color: Colors.white10,
          child: Column(
            children: [
              const DisplayText(
                text: "Choose Category",
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
                  crossAxisCount: 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemCount: categoryList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () async {
                      selected = await Functions()
                              .handleCategorySelected(
                                  context, categoryList.elementAt(index))
                          as Category?;
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 64,
                          width: 64,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: categoryList[index].categoryColor,
                          ),
                          child: Center(
                            child: Icon(categoryList[index].categoryIcon),
                          ),
                        ),
                        DisplayText(
                          text: categoryList[index].categoryText.toString(),
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //cancel button
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
                      Navigator.of(context).pop(selected);
                    },
                    ButtonText: "save",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
