// ignore_for_file: unused_element, non_constant_identifier_names, avoid_unnecessary_containers, unused_local_variable, use_build_context_synchronously, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/domain/firebaseauth.dart';
import 'package:todo_list_app/pages/login_page.dart';
import 'package:todo_list_app/pages/main_page.dart';
import 'package:todo_list_app/widgets/authentication.dart';
import 'package:todo_list_app/widgets/custom_elevatedbutton.dart.dart';
import 'package:todo_list_app/widgets/custom_textformfield.dart';
import 'package:todo_list_app/widgets/display_text.dart';

class RegisterationPage extends StatefulWidget {
  const RegisterationPage({super.key});

  @override
  State<RegisterationPage> createState() => _RegisterationPageState();
}

class _RegisterationPageState extends State<RegisterationPage> {
  final FirebaseAuthservice _auth = FirebaseAuthservice();

  final _formfield = GlobalKey<FormState>();
  final TextEditingController _Usernamecontroller = TextEditingController();
  final TextEditingController _Emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  @override
  void dispose() {
    _Usernamecontroller.dispose();
    _Emailcontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formfield,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //text register
                const Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                // username textformfield
                CustomTextFormField(
                  controller: _Usernamecontroller,
                  hintText: "Enter username",
                  labelText: "username",
                  keyboardType: TextInputType.text,
                  textvalidater: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter Userame";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 30,
                ),

                //password textformfield
                CustomTextFormField(
                  controller: _Emailcontroller,
                  hintText: "Enter Email",
                  labelText: "Email",
                  keyboardType: TextInputType.emailAddress,
                  textvalidater: (String? value) {
                    print(value);
                    if (value!.isEmpty) {
                      return "Please Enter Email";
                    } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                      return "Please Enter a Valid Email";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),

                //confirm textformfield
                CustomTextFormField(
                  controller: _passwordcontroller,
                  hintText: "Enter password",
                  labelText: "Confirm password",
                  keyboardType: TextInputType.text,
                  textvalidater: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter password";
                    } else if (value.length < 5) {
                      return "minimum length is 5";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),

                //register button
                CustomElevatedButton(
                  ButtonHight: 40,
                  BottonWidth: double.infinity,
                  Buttonaction: () {
                    UserRegisteredin(context);
                  },
                  ButtonText: "Register",
                ),
                const SizedBox(
                  height: 20,
                ),

                //divider
                Container(
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Divider(),
                      Text("or"),
                      Divider(),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),

                //signing with Google
                Authentication(
                  buttonaction: () {
                    FirebaseAuthservice().signinWithGoogle(context);
                  },
                  imageUrl: 'assets/logo/google_logo.png',
                  text: 'Login With Google',
                ),
                const SizedBox(
                  height: 30,
                ),
                //siging with apple
                Authentication(
                  buttonaction: () {},
                  imageUrl: 'assets/logo/apple_logo.png',
                  text: 'Login With Apple',
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const DisplayText(
                      text: "Allready have an account? ",
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                    GestureDetector(
                      onTap: () {
                        print("login button clicked");
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ));
                      },
                      child: const DisplayText(
                        text: "Login",
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

// Reisteration button
  void UserRegisteredin(BuildContext ctx) async {
    if (_formfield.currentState!.validate()) {
      _Usernamecontroller.text;
      _Emailcontroller.text;
      _passwordcontroller.text;
      signUp();
    } else {}
  }

  void signUp() async {
    String userName = _Usernamecontroller.text;
    String email = _Emailcontroller.text;
    String password = _passwordcontroller.text;

    User? user = await _auth.signUpwithusernameandpassword(email, password);
    if (user != null) {
      print('User Is Successfully created');
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) =>const MainPage(),
        ),
      );
    } else {
      print('some error happend');
    }
  }
}
