// import 'package:SHOPPING/core/widgets/customCreditCartItems.dart';
// import 'package:SHOPPING/core/widgets/defualt_buttom.dart';
// import 'package:SHOPPING/features/Checkout/presentation/paymentOPtiuons.dart';
// import 'package:flutter/material.dart';
// class PaymentOptionsScreen extends StatefulWidget {
//   @override
//   _PaymentOptionsScreenState createState() => _PaymentOptionsScreenState();
// }
// class _PaymentOptionsScreenState extends State<PaymentOptionsScreen> {
//   final GlobalKey<FormState> formKey = GlobalKey();
//   AutovalidateMode autovalidateMode=AutovalidateMode.disabled;
 
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("payment details"),
//         ),
//         body:
//             Padding(
//               padding: const EdgeInsets.only(left: 20.0,right: 20),
//               child: CustomScrollView(
//                 slivers: [
//                   SliverToBoxAdapter(
//                     child: PaymentOptions()
//                   ),   
//                   SliverToBoxAdapter(child: CreditCartItems(formKey: formKey, autovalidateMode: autovalidateMode,)),
//                    SliverFillRemaining(child: Align(
//                     alignment: Alignment.center,
//                     child: defbotton(textt: "pay", onpressed: (){
//                       if(formKey.currentState!.validate()){
//                         formKey.currentState!.save();
//                       }else{
//                         autovalidateMode=AutovalidateMode.always;
//                         setState(() {
//                         });
//                       }
//                     })))
//                 ],
//               ),
//             ),
//         );
//   }
// }