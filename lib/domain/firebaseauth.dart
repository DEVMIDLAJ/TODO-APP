// ignore_for_file: body_might_complete_normally_nullable, unused_catch_clause, avoid_print, use_build_context_synchronously, use_rethrow_when_possible, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import '../pages/main_page.dart';

class FirebaseAuthservice with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();

  // Sign up with email and password
  Future<User?> signUpwithusernameandpassword(
      String Email, String password) async {
    try {
      UserCredential credential = await auth.createUserWithEmailAndPassword(
          email: Email, password: password);
      return credential.user;
    } catch (e) {
      print('Some Error');
    }
    notifyListeners();
  }

  // Signin with email and password
  Future<User?> siningwithusernameandpassword(
      String Email, String password) async {
    try {
      UserCredential credential = await auth.signInWithEmailAndPassword(
          email: Email, password: password);
      print(credential.user);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      print('Some Error occured');
    }
    notifyListeners();
  }

  // Signin with Google
  signinWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        await auth.signInWithCredential(authCredential);
        // Navigate to the main page after successful sign-in
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const MainPage(),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
    notifyListeners();
  }
}
