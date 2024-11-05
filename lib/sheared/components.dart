import 'package:flutter/material.dart';


Widget defbotton({required textt, required onpressed, double? width}) =>
    Container(
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(10)),
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

Widget ProductItemBuilder(Product, index) => Column(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  '$Product[image]'), // Specify the asset image path
              fit: BoxFit.cover, // Cover the entire container
            ),
          ),
          height: 150,
          width: 100,
        ),
        Text("product name")
      ],
    );
