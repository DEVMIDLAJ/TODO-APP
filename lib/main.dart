// ignore_for_file: unused_local_variable

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/domain/provider.dart';
import 'package:todo_list_app/firebase_options.dart';
import 'package:todo_list_app/pages/main_page.dart';
import 'package:todo_list_app/pages/welcome_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //  SharedPreferences prefs = await SharedPreferences.getInstance();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
     // myPrifrences pfs = myPrifrences();
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => TodoProvider(),
          ),
        ],
        // child: FutureBuilder(
        //     future: pfs.userAllReadyLoggin(),
        //     builder: (context, snap) {
        // return MultiProvider(
        //   providers: [
        //     ChangeNotifierProvider(
        //       create: (context) => TodoProvider(),
        //     ),
        //   ],
          child:
         MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          darkTheme: ThemeData.dark(),
          themeMode: ThemeMode.dark,
          theme: ThemeData(
            primarySwatch: Colors.purple,
          ),
          home: AnimatedSplashScreen(
            splash: const Center(
              child: Column(
                children: [
                  Icon(
                    Icons.check_box_outlined,
                    size: 50,
                    color: Colors.purple,
                  ),
                  Text(
                    "UP TODO",
                  ),
                ],
              ),
            ),
            
            nextScreen: StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if(snapshot.hasData){
                  return const MainPage();
                }
                return const WellcomePage();
              }
            ),
            // snap.data == true ? const MainPage() : const WellcomePage(),
            backgroundColor: Colors.black,
          ),
        ));
  }
  //  ),
  // );
}
//}
