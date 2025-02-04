
import 'package:SHOPPING/features/Cart/presentation/cart_Screen.dart';
import 'package:SHOPPING/features/Checkout/widgets/thank_you_view_body.dart';
import 'package:SHOPPING/features/Home/presentation/home_layout.dart';
import 'package:flutter/material.dart';

class successscreen extends StatelessWidget {
  const successscreen({super.key, required this.Total});
 final double  Total;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(leading: IconButton(onPressed: (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeLayout()));
      }, icon: Icon(Icons.arrow_back)),),
      body: Center(child:ThankYouViewBody(Total: Total,)),
    );
  }
}