import 'package:checkout_feature/core/utils/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'Features/checkout/data/repo_imp/display_checkout_repo_imp.dart';
import 'Features/checkout/presentation/manager/cubit/checkout_cubit.dart';
import 'Features/checkout/presentation/views/my_cart_view.dart';
import 'core/utils/keys.dart';
import 'core/utils/services/stripe_paymeny_service.dart';

void main() {
  Stripe.publishableKey = Keys.stripePublishableKey;
  ApiService.init();
  runApp(const CheckoutApp());
}

class CheckoutApp extends StatelessWidget {
  const CheckoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckoutCubit(
        DisplayCheckoutRepoImp(
          StripePaymenyService(
            ApiService(),
          ),
        ),
      ),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyCartView(),
      ),
    );
  }
}
