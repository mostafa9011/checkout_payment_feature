import 'package:checkout_feature/core/utils/errors/failure.dart';
import 'package:dartz/dartz.dart';
import '../models/payment_intent_input_model.dart';

abstract class DisplayCheckoutRepo {
  Future<Either<Failure, void>> displayCheckoutSheet({
    required PaymentIntentInputModel paymentIntentInputModel,
  });
}
