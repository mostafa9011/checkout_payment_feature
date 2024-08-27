import 'package:checkout_feature/core/utils/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'Features/checkout/presentation/views/my_cart_view.dart';
import 'core/utils/keys.dart';

void main() {
  Stripe.publishableKey = Keys.stripePublishableKey;
  ApiService.init();
  runApp(const CheckoutApp());
}

class CheckoutApp extends StatelessWidget {
  const CheckoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyCartView(),
    );
  }
}
