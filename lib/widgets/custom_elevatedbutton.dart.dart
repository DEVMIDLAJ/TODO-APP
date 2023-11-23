// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.ButtonHight,
    required this.BottonWidth,
    required this.Buttonaction,
    required this.ButtonText,
  });
  final double ButtonHight;
  final double BottonWidth;
  final void Function() Buttonaction;
  final String ButtonText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ButtonHight,
      width: BottonWidth,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            const Color.fromARGB(255, 182, 83, 202),
          ),
        ),
        onPressed:Buttonaction,
        child: Text(
          ButtonText,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
