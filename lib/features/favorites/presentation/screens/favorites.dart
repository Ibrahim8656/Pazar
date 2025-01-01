import 'package:flutter/material.dart';
import 'package:SHOPPING/features/Home/cubit/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemBuilder: (context,index)=>Column(children: [
        Text("hi")
      ],),
      itemCount: 5,),
    );
  }
}
