

import 'package:SHOPPING/features/Checkout/presentation/thanks_view.dart';
import 'package:SHOPPING/features/Checkout/widgets/custom_check_icon.dart';
import 'package:SHOPPING/features/Checkout/widgets/custom_dashed_line.dart';
import 'package:flutter/material.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key, required this.Total});
final double  Total;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50,left: 20,right: 20,bottom: 20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
           ThankYouCard(Total:Total,),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height * .2 + 20,
            left: 20 + 8,
            right: 20 + 8,
            child: const CustomDashedLine(),
          ),
          Positioned(
              left: -20,
              bottom: MediaQuery.sizeOf(context).height * .2,
              child: const CircleAvatar(
                backgroundColor: Colors.white,
              )),
          Positioned(
              right: -20,
              bottom: MediaQuery.sizeOf(context).height * .2,
              child: const CircleAvatar(
                backgroundColor: Colors.white,
              )),
          const Positioned(
            top: -50,
            left: 0,
            right: 0,
            child: CustomCheckIcon(),
          ),
        ],
      ),
    );
  }
}