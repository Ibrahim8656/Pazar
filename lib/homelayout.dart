import 'package:flutter/material.dart';
import 'package:flutter_application_4/cubit/appcubit_cubit.dart';
import 'package:flutter_application_4/cubit/appcubit_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class Homelayout extends StatelessWidget {
  const Homelayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Shopcupit()..gitProducts()
        ..GitCatigories()
        ..GitFavoritsProducts()..GitCartProducts(),
      child: BlocConsumer<Shopcupit, Shopstates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            body: Shopcupit.get(context)
                .Screens[Shopcupit.get(context).CurrentIndex],
            bottomNavigationBar: BottomNavigationBar(
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.red,
              currentIndex: Shopcupit.get(context).CurrentIndex,
              items: items,
              onTap: (index) {
                Shopcupit.get(context).OntapOfbottomnavigatorbar(index);
              },
            ),
          );
        },
      ),
    );
  }
}

List<BottomNavigationBarItem> items = [
  BottomNavigationBarItem(
    icon: Icon(Icons.shop),
    label: 'products',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.category),
    label: 'Catigories',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.favorite_border_outlined),
    label: 'Fvorets',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.shopping_cart),
    label: 'Cart',
  )
];
