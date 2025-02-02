import 'package:SHOPPING/utils/decorations/colors.dart';
import 'package:flutter/material.dart';

Widget defbotton({required textt, required onpressed, double? width}) {
 return   Container(
      decoration: BoxDecoration(
          color: primarycolor, borderRadius: BorderRadius.circular(10)),
      width: width ?? 200,
      child: MaterialButton(
        onPressed: onpressed,
        child: Text(
          textt,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
    }
