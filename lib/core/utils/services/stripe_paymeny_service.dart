import 'package:checkout_feature/Features/checkout/data/models/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:checkout_feature/Features/checkout/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:checkout_feature/core/utils/services/api_service.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import '../../../Features/checkout/data/models/init_payment_sheet_input.dart';
import '../../../Features/checkout/data/models/payment_intent_input_model.dart';

class StripePaymenyService {
  final ApiService _apiService;
  StripePaymenyService(this._apiService);

  // (1) Create Payment Intent
  Future<PaymentIntentModel> createPaymentIntent(
    PaymentIntentInputModel input,
  ) async {
    var response = await _apiService.post(
      endPoint: '/v1/payment_intents',
      body: input.toJson(),
    );
    var paymentIntentModel = PaymentIntentModel.fromJson(response);
    return paymentIntentModel;
  }

  // (2) create Ephemeral Key {this is for customer not for Gist}
  Future<EphemeralKeyModel> createEphemeralKey({
    required String customerId,
  }) async {
    var response = await _apiService.post(
      endPoint: '/v1/ephemeral_keys',
      body: {
        'customer': customerId,
      },
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Stripe-Version': '2024-06-20',
      },
    );
    var ephemeralKeyModel = EphemeralKeyModel.fromJson(response);
    return ephemeralKeyModel;
  }

  // (3) init Payment Sheet
  Future<void> initPaymentSheet({
    required InitPaymentSheetInput initPaymentSheetInput,
  }) async {
    //initialize the payment sheet
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        // Main params
        merchantDisplayName: 'Mostafa Mohamed',
        paymentIntentClientSecret: initPaymentSheetInput.clientSecret,

        // Customer keys
        customerEphemeralKeySecret:
            initPaymentSheetInput.customerEphemeralKeySecret,
        customerId: initPaymentSheetInput.customerId,

        // style: ThemeMode.dark,
      ),
    );
  }

  // (4) present payment sheet
  Future<void> presentPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  // (5) display payment sheet
  Future<void> displayPaymentSheet({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);

    var ephemeralKeyModel = await createEphemeralKey(
      customerId: paymentIntentModel.customer!,
    );

    var initPaymentSheetInput = InitPaymentSheetInput(
      clientSecret: paymentIntentModel.clientSecret!,
      customerEphemeralKeySecret: ephemeralKeyModel.secret!,
      customerId: paymentIntentModel.customer!,
    );
    await initPaymentSheet(initPaymentSheetInput: initPaymentSheetInput);

    await presentPaymentSheet();
  }
}
