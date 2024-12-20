import 'package:flutter/material.dart';
import 'package:flutter_application_4/features/Home/cubit/home_cubit.dart';
import 'package:flutter_application_4/features/Home/data/callservices/Home_callservice.dart';
import 'package:flutter_application_4/features/Home/data/repository/home_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget build(BuildContext context) {
    int currentIndex = HomeCubit.get(context).currentIndex;
   
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text(HomeCubit.get(context).AppBarTitle[HomeCubit.get(context).currentIndex]),),
          // Main content
          body: HomeCubit.get(context).Screens[HomeCubit.get(context).currentIndex],
    
          // Floating Bottom Navigation Bar
          bottomNavigationBar: Container(
            margin: const EdgeInsets.all(16.0), // Margin to make it float
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24.0), // Rounded corners
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24.0), // Rounded corners
              child: BottomNavigationBar(
                
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    label: 'Search',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Profile',
                  ),
                ],
                currentIndex: HomeCubit.get(context).currentIndex,
                selectedItemColor: Colors.blue,
                unselectedItemColor: Colors.grey,
                onTap: (index) {
                  HomeCubit.get(context).ontaponbottomnavigationbar(index);
                  print(index);
                  print(currentIndex);
                },
                backgroundColor:
                    Colors.transparent, // Make background transparent
                elevation: 0, // Remove elevation
              ),
            ),
          ),
          backgroundColor:
              Colors.blueGrey[50], // To visualize the floating effect
        );
      },
    );
  }
}
