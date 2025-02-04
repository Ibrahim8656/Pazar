
import 'package:SHOPPING/core/methods/showPayment_options.dart';
import 'package:SHOPPING/core/methods/showsnackbaar.dart';
import 'package:SHOPPING/core/widgets/AddingAddressWidget.dart';
import 'package:SHOPPING/core/widgets/Cartitem.dart';
import 'package:SHOPPING/core/widgets/checkoutbottom.dart';
import 'package:SHOPPING/features/Cart/cubit/cart_cubit.dart';
import 'package:SHOPPING/utils/decorations/colors.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key, required this.Address});
  final String Address;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cartCubit = CartCubit.get(context);
        final cartProducts = cartCubit.cartproducts;
        final cartTotal = cartCubit.total;
        return Scaffold(
          appBar: AppBar(
            leading: Icon(
              Icons.shopping_cart,
              color: primarycolor,
            ),
            title: const Text("Cart"),
          ),
          body: Column(children: [
            AddingAddressWidget(Address: Address,),
            ConditionalBuilder(
              condition: cartProducts.isNotEmpty,
              builder: (context) => Expanded(
                child: ListView.builder(
                  itemCount: cartProducts.length,
                  itemBuilder: (context, index) => CartItem(
                    cartProduct: cartProducts,
                    index: index,
                  ),
                ),
              ),
              fallback: (context) => Center(
                child: CircularProgressIndicator(
                  color: primarycolor,
                ),
              ),
            ),
          ]),
          bottomSheet: cartProducts.isNotEmpty
              ? CheckoutBottom(
                  cartData: cartTotal,
                  onCheckoutPressed: () {
                    Address==''?showSnackbar(context: context, message: "plase Add your location", color: Colors.grey):
                    showPaymentOptions(context, cartTotal);
                  }
                      
                )
              : null,
        );
      },
    );
  }

  
}
