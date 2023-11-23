// ignore_for_file: camel_case_types, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:todo_list_app/domain/firebaseauth.dart';
// import 'package:todo_list_app/domain/prefrences.dart';
import 'package:todo_list_app/pages/login_page.dart';

class profilePage extends StatelessWidget {
  const profilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // myPrifrences prs = myPrifrences();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  //    prs.signout(context);
                  FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) =>const LoginPage(),
                      ),
                      (route) => false);
                },
                icon: const Icon(Icons.logout),
              ),
            ],
          ),
          const Center(
            child: Text("PRIFILE SCREEN"),
          ),
        ],
      ),
    );
  }
}
