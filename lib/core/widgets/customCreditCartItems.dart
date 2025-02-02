
// import 'package:flutter/material.dart';
// import 'package:flutter_credit_card/flutter_credit_card.dart';

// class CreditCartItems extends StatefulWidget {
//   const CreditCartItems({
//     super.key, required this.formKey, required this.autovalidateMode,
//   });
//  final GlobalKey<FormState>formKey;
//  final AutovalidateMode autovalidateMode;
//   @override
//   State<CreditCartItems> createState() => _CreditCartItemsState( );
// }

// class _CreditCartItemsState extends State<CreditCartItems> {
//   String cardNumber = "", expiryDate = "", cardHolderName = "", cvvCode = "";

//   bool showBackView = false;

//   _CreditCartItemsState();
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         CreditCardWidget(
          
//           isHolderNameVisible: true,
//             cardNumber: cardNumber,
//             expiryDate: expiryDate,
//             cardHolderName: cardHolderName,
//             cvvCode: cvvCode,
//             showBackView: showBackView,
//             onCreditCardWidgetChange: (value) {}),
//         CreditCardForm(
//           autovalidateMode: widget.autovalidateMode,
//             cardNumber: cardNumber,
//             expiryDate: expiryDate,
//             cardHolderName: cardHolderName,
//             cvvCode: cvvCode,
//             onCreditCardModelChange: (CreditCardModel){
//          cardNumber=CreditCardModel.cardNumber;
//          expiryDate=CreditCardModel.expiryDate;
//          cardHolderName=CreditCardModel.cardHolderName;
//          cvvCode=CreditCardModel.cvvCode;
//          showBackView=CreditCardModel.isCvvFocused;
//          setState(() {
           
//          });
    
//             },
//             formKey: widget.formKey),
           
             
//       ],
//     );
//   }
// }
