import 'package:checkout_feature/Features/checkout/data/repos/display_chechout_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/payment_intent_input_model.dart';
part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit(this._displayCheckoutRepo) : super(CheckoutInitial());
  final DisplayCheckoutRepo _displayCheckoutRepo;

  Future<void> displayCheckoutSheet({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    emit(CheckoutLoading());
    final result = await _displayCheckoutRepo.displayCheckoutSheet(
      paymentIntentInputModel: paymentIntentInputModel,
    );
    result.fold(
      (failure) => emit(CheckoutFailure(message: failure.message)),
      (_) => emit(CheckoutSuccess()),
    );
  }
}
