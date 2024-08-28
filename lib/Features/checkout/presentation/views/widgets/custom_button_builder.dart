import 'package:checkout_feature/Features/checkout/presentation/manager/cubit/checkout_cubit.dart';
import 'package:checkout_feature/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomButtonBuilder extends StatelessWidget {
  const CustomButtonBuilder({
    super.key,
    this.onTap,
    required this.text,
  });

  final void Function()? onTap;

  final String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: ShapeDecoration(
          color: const Color(0xFF34A853),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: BlocBuilder<CheckoutCubit, CheckoutState>(
          builder: (context, state) {
            if (state is CheckoutLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            }
            return Center(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: Styles.style22,
              ),
            );
          },
        ),
      ),
    );
  }
}
