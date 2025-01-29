class PaymentMethodOptions {
  final CardOptions card;

  PaymentMethodOptions({required this.card});

  factory PaymentMethodOptions.fromJson(Map<String, dynamic> json) {
    return PaymentMethodOptions(
      card: CardOptions.fromJson(json['card']),
    );
  }

  Map<String, dynamic> toJson() => {'card': card.toJson()};
}

class CardOptions {
  final dynamic installments;
  final dynamic mandateOptions;
  final dynamic network;
  final String requestThreeDSecure;

  CardOptions({
    this.installments,
    this.mandateOptions,
    this.network,
    required this.requestThreeDSecure,
  });

  factory CardOptions.fromJson(Map<String, dynamic> json) {
    return CardOptions(
      installments: json['installments'],
      mandateOptions: json['mandate_options'],
      network: json['network'],
      requestThreeDSecure: json['request_three_d_secure'] ?? 'automatic',
    );
  }

  Map<String, dynamic> toJson() => {
    'installments': installments,
    'mandate_options': mandateOptions,
    'network': network,
    'request_three_d_secure': requestThreeDSecure,
  };
}