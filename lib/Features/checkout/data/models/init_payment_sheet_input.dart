class InitPaymentSheetInput {
  final String clientSecret;
  final String customerEphemeralKeySecret;
  final String customerId;

  InitPaymentSheetInput({
    required this.clientSecret,
    required this.customerEphemeralKeySecret,
    required this.customerId,
  });
}
