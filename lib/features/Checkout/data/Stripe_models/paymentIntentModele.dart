import 'package:SHOPPING/features/Checkout/data/Stripe_models/amount_details_model.dart';
import 'package:SHOPPING/features/Checkout/data/Stripe_models/automatic_payment_methods_model.dart';
import 'package:SHOPPING/features/Checkout/data/Stripe_models/payment_method_options_model.dart';

class PaymentIntentModel {
  final String id;
  final String object;
  final int amount;
  final int amountCapturable;
  final AmountDetails amountDetails;
  final int amountReceived;
  final String? application;
  final int? applicationFeeAmount;
  final AutomaticPaymentMethods automaticPaymentMethods;
  final int? canceledAt;
  final String? cancellationReason;
  final String captureMethod;
  final String clientSecret;
  final String confirmationMethod;
  final int created;
  final String currency;
  final String? customer;
  final String? description;
  final String? invoice;
  final dynamic lastPaymentError; // Can be a String or Map
  final dynamic latestCharge; // Can be a String or Map
  final bool livemode;
  final Map<String, dynamic> metadata;
  final dynamic nextAction; // Can be a String or Map
  final dynamic onBehalfOf; // Can be a String or Map
  final dynamic paymentMethod; // Can be a String or Map
  final dynamic paymentMethodConfigurationDetails;
  final PaymentMethodOptions paymentMethodOptions;
  final List<String> paymentMethodTypes;
  final dynamic processing;
  final dynamic receiptEmail;
  final dynamic review;
  final dynamic setupFutureUsage;
  final dynamic shipping;
  final dynamic source;
  final dynamic statementDescriptor;
  final dynamic statementDescriptorSuffix;
  final String status;
  final dynamic transferData; // Can be a String or Map
  final dynamic transferGroup;

  PaymentIntentModel({
    required this.id,
    required this.object,
    required this.amount,
    required this.amountCapturable,
    required this.amountDetails,
    required this.amountReceived,
    this.application,
    this.applicationFeeAmount,
    required this.automaticPaymentMethods,
    this.canceledAt,
    this.cancellationReason,
    required this.captureMethod,
    required this.clientSecret,
    required this.confirmationMethod,
    required this.created,
    required this.currency,
    this.customer,
    this.description,
    this.invoice,
    this.lastPaymentError,
    this.latestCharge,
    required this.livemode,
    required this.metadata,
    this.nextAction,
    this.onBehalfOf,
    this.paymentMethod,
    this.paymentMethodConfigurationDetails,
    required this.paymentMethodOptions,
    required this.paymentMethodTypes,
    this.processing,
    this.receiptEmail,
    this.review,
    this.setupFutureUsage,
    this.shipping,
    this.source,
    this.statementDescriptor,
    this.statementDescriptorSuffix,
    required this.status,
    this.transferData,
    this.transferGroup,
  });

  factory PaymentIntentModel.fromJson(Map<String, dynamic> json) {
    return PaymentIntentModel(
      id: json['id'] as String,
      object: json['object'] as String,
      amount: json['amount'] as int,
      amountCapturable: json['amount_capturable'] as int,
      amountDetails: AmountDetails.fromJson(json['amount_details']),
      amountReceived: json['amount_received'] as int,
      application: json['application'],
      applicationFeeAmount: json['application_fee_amount'],
      automaticPaymentMethods: AutomaticPaymentMethods.fromJson(json['automatic_payment_methods']),
      canceledAt: json['canceled_at'],
      cancellationReason: json['cancellation_reason'],
      captureMethod: json['capture_method'] as String,
      clientSecret: json['client_secret'] as String,
      confirmationMethod: json['confirmation_method'] as String,
      created: json['created'] as int,
      currency: json['currency'] as String,
      customer: _convertToString(json['customer']),
      description: json['description'],
      invoice: _convertToString(json['invoice']),
      lastPaymentError: json['last_payment_error'],
      latestCharge: json['latest_charge'],
      livemode: json['livemode'] as bool,
      metadata: json['metadata'] != null ? Map<String, dynamic>.from(json['metadata']) : {},
      nextAction: json['next_action'],
      onBehalfOf: json['on_behalf_of'],
      paymentMethod: json['payment_method'],
      paymentMethodConfigurationDetails: json['payment_method_configuration_details'],
      paymentMethodOptions: PaymentMethodOptions.fromJson(json['payment_method_options']),
      paymentMethodTypes: List<String>.from(json['payment_method_types']),
      processing: json['processing'],
      receiptEmail: json['receipt_email'],
      review: json['review'],
      setupFutureUsage: json['setup_future_usage'],
      shipping: json['shipping'],
      source: json['source'],
      statementDescriptor: json['statement_descriptor'],
      statementDescriptorSuffix: json['statement_descriptor_suffix'],
      status: json['status'] as String,
      transferData: json['transfer_data'],
      transferGroup: json['transfer_group'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'object': object,
      'amount': amount,
      'amount_capturable': amountCapturable,
      'amount_details': amountDetails.toJson(),
      'amount_received': amountReceived,
      'application': application,
      'application_fee_amount': applicationFeeAmount,
      'automatic_payment_methods': automaticPaymentMethods.toJson(),
      'canceled_at': canceledAt,
      'cancellation_reason': cancellationReason,
      'capture_method': captureMethod,
      'client_secret': clientSecret,
      'confirmation_method': confirmationMethod,
      'created': created,
      'currency': currency,
      'customer': customer,
      'description': description,
      'invoice': invoice,
      'last_payment_error': lastPaymentError,
      'latest_charge': latestCharge,
      'livemode': livemode,
      'metadata': metadata,
      'next_action': nextAction,
      'on_behalf_of': onBehalfOf,
      'payment_method': paymentMethod,
      'payment_method_configuration_details': paymentMethodConfigurationDetails,
      'payment_method_options': paymentMethodOptions.toJson(),
      'payment_method_types': paymentMethodTypes,
      'processing': processing,
      'receipt_email': receiptEmail,
      'review': review,
      'setup_future_usage': setupFutureUsage,
      'shipping': shipping,
      'source': source,
      'statement_descriptor': statementDescriptor,
      'statement_descriptor_suffix': statementDescriptorSuffix,
      'status': status,
      'transfer_data': transferData,
      'transfer_group': transferGroup,
    };
  }

  static String? _convertToString(dynamic value) {
    if (value == null) return null;
    if (value is String) return value;
    if (value is Map<String, dynamic>) return value.toString();
    return null;
  }
}
