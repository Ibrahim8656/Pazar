import 'package:SHOPPING/core/widgets/defualt_buttom.dart';
import 'package:SHOPPING/utils/decorations/colors.dart';
import 'package:flutter/material.dart';

class CheckoutBottom extends StatelessWidget {
  final double cartData;
  final VoidCallback onCheckoutPressed;

  const CheckoutBottom({
    super.key,
    required this.cartData,
    required this.onCheckoutPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Total:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '\$${cartData.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color:primarycolor,
                    ),
                  ),
                ],
              ),
            ),
            defbotton(
              textt: 'Checkout',
              onpressed: onCheckoutPressed,
              width: 150,  
            ),
          ],
        ),
      ),
    );
  }
}
