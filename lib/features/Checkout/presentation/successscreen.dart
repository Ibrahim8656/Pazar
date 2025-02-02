
import 'package:SHOPPING/features/Checkout/widgets/thank_you_view_body.dart';
import 'package:flutter/material.dart';

class successscreen extends StatelessWidget {
  const successscreen({super.key, required this.Total});
 final double  Total;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Center(child:ThankYouViewBody(Total: Total,)),
    );
  }
}