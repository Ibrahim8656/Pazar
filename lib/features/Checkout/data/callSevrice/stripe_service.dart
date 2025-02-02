import 'package:SHOPPING/core/Helpers/Dio_helper/dio_helper.dart';
import 'package:SHOPPING/features/Checkout/data/ApisKeys.dart';
import 'package:SHOPPING/features/Checkout/data/Stripe_models/payment_intent_input_model.dart';
import 'package:SHOPPING/features/Checkout/data/Stripe_models/paymentIntentModele.dart';
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService{
Future<PaymentIntentModel >CreatePaymentIntent(PaymentIntentInputModell PaymentintentInpoutmodel)async{
  var response =await DioHelper.postdata(Url:"https://api.stripe.com/v1/payment_intents" ,
  data:PaymentintentInpoutmodel.toJson() ,
  Content_Type:Headers.formUrlEncodedContentType,
  token:'Bearer ${Apiskeys.secretkey}');

  var paymentIntentModele =PaymentIntentModel.fromJson(response.data);
  return paymentIntentModele;
}
Future Initpaymentsheet({required String paymentIntentClientSecret})async{
  await Stripe.instance.initPaymentSheet(paymentSheetParameters: SetupPaymentSheetParameters(
    paymentIntentClientSecret: paymentIntentClientSecret,
    merchantDisplayName: "Ibrahim"
  ));
}
Future DisplayPaymentSheet()async{
 await Stripe.instance.presentPaymentSheet();
}
 Future MakePayment({required PaymentIntentInputModell PaymentintentInpoutmodel})async{
  var paymentIntentModele=await CreatePaymentIntent(PaymentintentInpoutmodel);
  await Initpaymentsheet(paymentIntentClientSecret: paymentIntentModele.clientSecret);
  await DisplayPaymentSheet();
}
}