import 'package:SHOPPING/features/Checkout/presentation/thanks_view.dart';
import 'package:flutter/material.dart';

class successscreen extends StatelessWidget {
  const successscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child:ThankYouCard()),
    );
  }
}