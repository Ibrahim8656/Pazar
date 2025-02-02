import 'package:flutter/material.dart';

class CustomCheckIcon extends StatelessWidget {
  const CustomCheckIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 50,
      backgroundColor: Color(0xFFD9D9D9),
      child: CircleAvatar(
        radius: 40,
        backgroundColor: Color.fromARGB(255, 7, 223, 65),
        child: Icon(
          Icons.check,
          size: 50,color: Colors.white,
        ),
      ),
    );
  }
}