import 'package:flutter/material.dart';

class Authentication extends StatelessWidget {
  const Authentication({
    super.key,
    required this.buttonaction,
    required this.text,
    required this.imageUrl,
  });
  final void Function() buttonaction;
  final String text;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: 
       
        buttonaction,      
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.purple,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              child: Image(
                image: AssetImage(
                  imageUrl,
                ),
                height: 25,
                width: 40,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.w600
              ),
            ),
          ],
        ),
      ),
    );
  }
}
