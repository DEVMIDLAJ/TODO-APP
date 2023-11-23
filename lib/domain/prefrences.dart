// // ignore_for_file: use_build_context_synchronously, camel_case_types, unused_local_variable, avoid_print

// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:todo_list_app/pages/main_page.dart';
// import 'package:todo_list_app/pages/registration_page.dart';
// import 'package:todo_list_app/pages/welcome_page.dart';

// class myPrifrences {
//   //
//   setUserLogginDataSave() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setBool("goToLoggin", true);
//   }

// //user logindata save function
//   getUserLogginDataSave(
//       {required BuildContext ctx,
//       required String un,
//       required String pw}) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     if (un == userName && pw == userPassword) { 
//       prefs.setBool("goToLoggin", true);
//       await Navigator.push(
//           ctx,
//           MaterialPageRoute(
//             builder: (context) => const MainPage(),
//           ));
//       ScaffoldMessenger.of(ctx).showSnackBar(
//         const SnackBar(
//           content: Text('User Login successfully'),
//           behavior: SnackBarBehavior.floating,
//           padding: EdgeInsets.all(20),
//         ),
//       );
//     } else {
//       ScaffoldMessenger.of(ctx).showSnackBar(
//         const SnackBar(
//           content: Text('Invalid Enter'),
//           behavior: SnackBarBehavior.floating,
//           padding: EdgeInsets.all(20),
//         ),
//       );
//     }
//   }

//   //user register data saved function
//   getUserRegisterDataSave(
//       {required String username1,
//       required String password1,
//       required BuildContext context}) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     if (username1 == userName && password1 == userPassword) {
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//         content: Text('User Register successfully'),
//         behavior: SnackBarBehavior.floating,
//         padding: EdgeInsets.all(20),
//       ));
//       Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => const MainPage(),
//           ));
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//         content: Text('InValid Enter'),
//         behavior: SnackBarBehavior.floating,
//         padding: EdgeInsets.all(20),
//       ));
//     }
//   }

// //user Re open this app checklogin function
//   Future<bool> userAllReadyLoggin() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     bool checkLogin = prefs.getBool("goToLoggin") ?? false;
//     return checkLogin;
//   }

// //user signout function
//   signout(BuildContext context) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.remove('goToLoggin');
//     Navigator.of(context).pushAndRemoveUntil(
//         MaterialPageRoute(builder: (context) => const WellcomePage()),
//         (Route<dynamic> route) => false);
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(
//         content: Text('User Logout this app'),
//         behavior: SnackBarBehavior.floating,
//         padding: EdgeInsets.all(20),
//       ),
//     );
//   }
// }
