
class PaymentIntentInputModell {
  final String amount;
  final String currency;

  const PaymentIntentInputModell({
    required this.amount,
    required this.currency,
  });
  toJson(){
    return{
     "amount":amount,
     "currency":currency
    };
  }
  }