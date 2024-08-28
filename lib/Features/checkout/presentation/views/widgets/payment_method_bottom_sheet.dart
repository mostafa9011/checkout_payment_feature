import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/payment_intent_input_model.dart';
import '../../manager/cubit/checkout_cubit.dart';
import 'custom_button_builder.dart';
import 'payment_methods_list_view.dart';

class PaymentMethodsBottomSheet extends StatelessWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 16,
          ),
          const PaymentMethodsListView(),
          const SizedBox(
            height: 32,
          ),
          CustomButtonBuilder(
            text: 'Continue',
            onTap: () {
              var paymentIntentInputModel = PaymentIntentInputModel(
                currency: 'usd',
                amount: '1030',
                customerId: 'cus_QkHUycbhe3MzWN',
              );
              BlocProvider.of<CheckoutCubit>(context).displayCheckoutSheet(
                context,
                paymentIntentInputModel: paymentIntentInputModel,
              );
            },
          ),
        ],
      ),
    );
  }
}
