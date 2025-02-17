import 'package:SHOPPING/utils/decorations/colors.dart';
import 'package:SHOPPING/utils/styles.dart';
import 'package:flutter/material.dart';

TextFormField Textformfild(String validatemessage, String hintText,
    TextEditingController controller, bool obscurstatus) {
  return TextFormField(
    validator: (value) {
      if (value!.isEmpty) {
        return validatemessage;
      }
      return null;
    },
    controller: controller,
    decoration: InputDecoration(
      fillColor: Colors.grey[100],
      filled: true,
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: primarycolor, width: 2.0),),
           enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: const Color.fromARGB(255, 204, 204, 204), width: 1.0),),
          disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: primarycolor, width: 2.0),),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide:BorderSide(color: primarycolor),
       
      ),
      hintText: hintText,
      hintStyle:Styles.style18.copyWith(color: Colors.grey,fontSize: 15)
      ),
    obscureText: obscurstatus,
  );
}