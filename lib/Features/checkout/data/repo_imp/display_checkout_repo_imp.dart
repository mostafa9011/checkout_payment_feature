import 'package:checkout_feature/Features/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_feature/core/utils/errors/failure.dart';
import 'package:checkout_feature/core/utils/services/stripe_paymeny_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/utils/errors/server_failure.dart';
import '../repos/display_chechout_repo.dart';

class DisplayCheckoutRepoImp extends DisplayCheckoutRepo {
  final StripePaymenyService _stripePaymenyService;

  DisplayCheckoutRepoImp(this._stripePaymenyService);

  @override
  Future<Either<Failure, void>> displayCheckoutSheet({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    try {
      await _stripePaymenyService.displayPaymentSheet(
        paymentIntentInputModel: paymentIntentInputModel,
      );

      return right(null);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
