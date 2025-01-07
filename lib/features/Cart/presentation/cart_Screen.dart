import 'package:SHOPPING/core/widgets/Cartitem.dart';
import 'package:SHOPPING/features/Cart/cubit/cart_cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        bool isinfav = false;
        final cartProduct = CartCubit.get(context).cartproducts;
        return Scaffold(
            appBar: AppBar(
              leading: Icon(Icons.shopping_cart),
              title: Text("cart"),
            ),
            body: ConditionalBuilder(
                condition: cartProduct.isNotEmpty,
                builder: (context) => ListView.builder(
                    itemBuilder: (context, index) => CartItem(
                          cartProduct: cartProduct,
                          index: index,
                        ),
                    
                    itemCount: cartProduct.length),
                fallback: (context) =>
                    Center(child: CircularProgressIndicator())));
      },
    );
  }
}
