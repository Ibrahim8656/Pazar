import 'package:SHOPPING/core/methods/showsnackbaar.dart';
import 'package:SHOPPING/features/Checkout/cubit/checkout_cubit.dart';
import 'package:SHOPPING/features/Checkout/data/Stripe_models/payment_intent_input_model.dart';
import 'package:SHOPPING/features/Checkout/presentation/successscreen.dart';
import 'package:SHOPPING/utils/decorations/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentOptions extends StatelessWidget {
  const PaymentOptions({super.key, required this.Total});
final double Total;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Select Payment Method',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          _buildPaymentOption(Icons.credit_card, 'Credit Card'),
          _buildPaymentOption(Icons.paypal, 'PayPal'),
          _buildPaymentOption(Icons.account_balance_wallet, 'Wallet'),
          const SizedBox(height: 20),
          BlocConsumer<CheckoutCubit, CheckoutState>(
    listener: (context, state) {
      if (state is CheckoutSuccess) {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) =>  successscreen(Total: Total,)
        ));
      } else if (state is CheckoutError) {
        Navigator.of(context).pop();
        showSnackbar(
          context: context,
          message: state.error, // Lowercase 'error'
          color: Colors.red
        );
      }
    },
    builder: (context, state) {
      return Container(
        decoration: BoxDecoration(
          color: primarycolor, // Fixed casing
          borderRadius: BorderRadius.circular(10)
        ),
        width: 200,
        child: MaterialButton(
          onPressed: () {
            PaymentIntentInputModell paymentIntent = PaymentIntentInputModell(
              amount: '1000', 
              currency: 'USD');
            CheckoutCubit.get(context)..makePayment(
               paymentintent: paymentIntent // Correct parameter name
            );
          },
          child: state is CheckoutLoading
            ? const CircularProgressIndicator()
            : const Text(
                "Continue",
                style: TextStyle(
                  fontSize: 16, 
                  fontWeight: FontWeight.bold, 
                  color: Colors.white
                ),
              ),
        ),
      );
    },
  ),
        ],
      ),
    );
  }

  Widget _buildPaymentOption(IconData icon, String text) {
    return ListTile(
      leading: Icon(icon, color: primarycolor),
      title: Text(text),
      onTap: () {
        // Handle payment method selection
      },
    );
  }
}
