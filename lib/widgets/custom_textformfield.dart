
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final TextInputType keyboardType;   
  final String? Function(String?)? textvalidater;
  
  const CustomTextFormField({
    super.key,

    required this.controller,
    required this.hintText,
    required this.labelText,
    required this.keyboardType,
    required this.textvalidater, 
    
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.purple,
              ),
            ),           
            border: const OutlineInputBorder(),   
            hintText: hintText,
          ),
          autofocus: true,
          validator: textvalidater,
          keyboardType: keyboardType,
          
        ),
      ],
    );
  }
}
