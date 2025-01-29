
import 'package:SHOPPING/features/Checkout/data/Stripe_models/payment_intent_input_model.dart';
import 'package:SHOPPING/features/Checkout/data/callSevrice/stripe_service.dart';
import 'package:dartz/dartz.dart';

 class Paymentrepository {
 final StripeService stripeService;

  Paymentrepository(this.stripeService);
  
  Future<Either<Failuer,void>> Makepayment({required PaymentIntentInputModell paymentintent})async{
    try{
      await stripeService.MakePayment(PaymentintentInpoutmodel: paymentintent);
      return right(null);
    }catch(Error){
      print(Error.toString());
      return left(serverFailuer(Error.toString()));
    }
  }
}
 abstract class Failuer{
    final String Error;

  Failuer(this.Error);
  }
  class serverFailuer extends Failuer{
    serverFailuer(super.Error);
  }