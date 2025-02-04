import 'package:SHOPPING/core/widgets/paymentOPtiuons%20copy.dart';
import 'package:SHOPPING/features/Checkout/cubit/checkout_cubit.dart';
import 'package:SHOPPING/features/Checkout/data/PaymentRepository/paymentRepository.dart';
import 'package:SHOPPING/features/Checkout/data/callSevrice/stripe_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void showPaymentOptions(BuildContext context, double Total) {
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
          child: PaymentOptions(
            Total: Total,
          ),
        ),
      ),
    );
  }