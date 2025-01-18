import 'package:SHOPPING/core/widgets/Cartitem.dart';
import 'package:SHOPPING/features/Cart/cubit/cart_cubit.dart';
import 'package:SHOPPING/utils/decorations/colors.dart';
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
        final cartdata=CartCubit.get(context).total;
        return Scaffold(
          appBar: AppBar(
            leading: Icon(Icons.shopping_cart,color: primarycolor,),
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
            fallback: (context) => Center(
              child: CircularProgressIndicator(color: primarycolor,),
            ),
          ),
          bottomSheet: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: MediaQuery.sizeOf(context).height*.075,
            decoration: BoxDecoration(
              color: primarycolor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("EGP ",style: TextStyle(color: Colors.white),),
                  Text("${cartdata.toInt()}",style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),),Spacer(),
                  Text(
                    "CHECHOUT",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward,color: Colors.white,),
                  
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
