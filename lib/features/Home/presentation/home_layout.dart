import 'package:SHOPPING/features/Cart/cubit/cart_cubit.dart';
import 'package:SHOPPING/utils/decorations/colors.dart';
import 'package:flutter/material.dart';
import 'package:SHOPPING/features/Home/cubit/home_cubit.dart';
import 'package:SHOPPING/features/Home/data/callservices/Home_callservice.dart';
import 'package:SHOPPING/features/Home/data/repository/home_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  Widget build(BuildContext context) {
    int currentIndex = HomeCubit.get(context).currentIndex;
   
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          // Main content
          body:HomeCubit.get(context).Screens[HomeCubit.get(context).currentIndex],
    
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
                
                items: <BottomNavigationBarItem>[
                  const BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  const BottomNavigationBarItem(
                    icon: Icon(Icons.category),
                    label: 'category',
                  ),
                  BottomNavigationBarItem(
                    icon: Badge.count(
                      count: CartCubit.get(context).cartproducts.length,
                      backgroundColor: primarycolor,
                      child: Icon(Icons.shopping_cart)),
                    label: 'Cart',
                  ),
                  const BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Profile',
                  ),
                ],
                currentIndex: HomeCubit.get(context).currentIndex,
                selectedItemColor: primarycolor,
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
             Colors.white, // To visualize the floating effect
        );
      },
    );
  }
}
