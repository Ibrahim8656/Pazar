import 'package:SHOPPING/core/widgets/defualt_buttom.dart';
import 'package:SHOPPING/utils/decorations/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class PaymentOptionsScreen extends StatefulWidget {
  @override
  _PaymentOptionsScreenState createState() => _PaymentOptionsScreenState();
}

class _PaymentOptionsScreenState extends State<PaymentOptionsScreen> {
  int _selectedOption = 0;

  final List<Map<String, dynamic>> _paymentOptions = [
    {'label': 'Credit Card', 'image': "assets/images/visa.png"},
    {'label': 'PayPal', 'image': "assets/images/paypal.jpg"},
    {'label': 'Apple Pay', 'image': "assets/images/paypal.jpg"},
  ];
  int _selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("payment details"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 80,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      _selectedindex = index;
                      setState(() {});
                    },
                    child: Container(
                      height: 70,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: _selectedindex == index
                                ? primarycolor
                                : Colors.grey,
                            width: 2.5,
                          )),
                      child: Center(
                        child: Image(
                            image: AssetImage(_paymentOptions[index]["image"])),
                      ),
                    ),
                  ),
                  itemCount: _paymentOptions.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(
                    width: 10,
                  ),
                ),
              ),
                 SizedBox(height: 30,),
              CreditCartItems(),
              SizedBox(height: 50,),
              defbotton(textt: "pay", onpressed: (){})
            ],
          ),
        )
        
        );
  }
}

class CreditCartItems extends StatefulWidget {
  const CreditCartItems({
    super.key,
  });

  @override
  State<CreditCartItems> createState() => _CreditCartItemsState();
}

class _CreditCartItemsState extends State<CreditCartItems> {
  String cardNumber = "", expiryDate = "", cardHolderName = "", cvvCode = "";

  bool showBackView = false;
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreditCardWidget(
          isHolderNameVisible: true,
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            showBackView: showBackView,
            onCreditCardWidgetChange: (value) {}),
        CreditCardForm(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            onCreditCardModelChange: (CreditCardModel){
         cardNumber=CreditCardModel.cardNumber;
         expiryDate=CreditCardModel.expiryDate;
         cardHolderName=CreditCardModel.cardHolderName;
         cvvCode=CreditCardModel.cvvCode;
         showBackView=CreditCardModel.isCvvFocused;
         setState(() {
           
         });

            },
            formKey: formKey)
      ],
    );
  }
}
