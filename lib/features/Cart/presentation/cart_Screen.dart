import 'package:SHOPPING/core/widgets/Cartitem.dart';
import 'package:SHOPPING/core/widgets/checkoutbottom.dart';
import 'package:SHOPPING/core/widgets/paymentOPtiuons.dart';
import 'package:SHOPPING/features/Cart/cubit/cart_cubit.dart';
import 'package:SHOPPING/features/Checkout/cubit/checkout_cubit.dart';
import 'package:SHOPPING/features/Checkout/data/PaymentRepository/paymentRepository.dart';
import 'package:SHOPPING/features/Checkout/data/callSevrice/stripe_service.dart';
import 'package:SHOPPING/utils/decorations/colors.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

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
          body: ConditionalBuilder(
            condition: cartProducts.isNotEmpty,
            builder: (context) => ListView.builder(
              itemCount: cartProducts.length,
              itemBuilder: (context, index) => CartItem(
                cartProduct: cartProducts,
                index: index,
              ),
            ),
            fallback: (context) => Center(
              child: CircularProgressIndicator(
                color: primarycolor,
              ),
            ),
          ),
          bottomSheet: cartProducts.isNotEmpty
              ? CheckoutBottom(
                  cartData: cartTotal,
                  onCheckoutPressed: () => _showPaymentOptions(context),
                )
              : null,
        );
      },
    );
  }

  void _showPaymentOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: BlocProvider(
          create: (context) =>
              CheckoutCubit(Paymentrepository(StripeService())),
          child: const PaymentOptions(),
        ),
      ),
    );
  }
}
