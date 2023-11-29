// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:todo_list_app/pages/login_page.dart';
import 'package:todo_list_app/pages/registration_page.dart';

class WellcomePage extends StatelessWidget {
  const WellcomePage({super.key});

  @override
  Widget build(BuildContext context) {
       return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              //text 1
              const Text(
                "Welcome to UpTodo",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //text 2
              const Text(
                "Please login to your account or create \n            new account to continue",
              ),
              const Spacer(),

              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>const LoginPage(),
                    ));
                  },
                  child: const Text("Login"),
                ),
              ),
              const SizedBox(height: 10),
              const SizedBox(
                height: 10,
              ),
              //create account button
              SizedBox(
                height: 50,
                width: double.infinity,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: const BorderSide(
                      color: Colors.purple,
                      width: 3,
                    ),
                  ),
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterationPage(),
                      ),
                    );
                  },
                  child: const Text("CREATE ACCOUNT"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
