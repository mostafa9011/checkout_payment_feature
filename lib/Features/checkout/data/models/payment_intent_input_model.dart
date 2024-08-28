class PaymentIntentInputModel {
  final String currency;
  final String amount;
  final String customerId;
  PaymentIntentInputModel({
    required this.currency,
    required this.amount,
    required this.customerId,
  });

  Map<String, dynamic> toJson() => {
        'currency': currency,
        'amount': amount,
        'customer': customerId,
      };
}
