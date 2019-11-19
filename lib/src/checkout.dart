import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:yandex_checkout/src/payment_parameters.dart';
import 'package:yandex_checkout/src/tokenization_result.dart';

class Checkout {
  static const platform = const MethodChannel('example.com/yandex');

  static Future<TokenizationResult> createTokenize(
    PaymentParameters paymentParameters
  ) {
    if (defaultTargetPlatform != TargetPlatform.android) {
      throw UnimplementedError(
        'The yandex payment flutter plugin doesn\'t implemented for $defaultTargetPlatform yet');
    }

    return platform.invokeMethod('showYandexPayment', paymentParameters.toMap())
      .then((r) => TokenizationResult.fromMap(r));
  }

  static Future<TokenizationResult> tryCreateTokenize(
    PaymentParameters paymentParameters
  ) {
    return createTokenize(paymentParameters).catchError((e) => null);
  }
}
