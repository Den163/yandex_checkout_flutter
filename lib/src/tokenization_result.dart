import 'package:yandex_checkout/src/payment_method_type.dart';
import 'package:meta/meta.dart';

class TokenizationResult {
  final String paymentToken;
  final PaymentMethodType paymentMethodType;

  const TokenizationResult({
    @required this.paymentToken,
    @required this.paymentMethodType,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is TokenizationResult &&
              runtimeType == other.runtimeType &&
              paymentToken == other.paymentToken &&
              paymentMethodType == other.paymentMethodType
          );

  @override
  int get hashCode =>
      paymentToken.hashCode ^
      paymentMethodType.hashCode;

  @override
  String toString() {
    return 'TokenizationResult{' +
        ' paymentToken: $paymentToken,' +
        ' paymentMethodType: $paymentMethodType,' +
        '}';
  }

  TokenizationResult copyWith({
    String paymentToken,
    PaymentMethodType paymentMethodType,
  }) {
    return new TokenizationResult(
      paymentToken: paymentToken ?? this.paymentToken,
      paymentMethodType: paymentMethodType ?? this.paymentMethodType,
    );
  }

  Map toMap() {
    return {
      'paymentToken': this.paymentToken,
      'paymentMethodType': paymentMethodTypeToString(this.paymentMethodType),
    };
  }

  factory TokenizationResult.fromMap(Map map) {
    if (map == null) return null;

    return new TokenizationResult(
      paymentToken: map['paymentToken'] as String,
      paymentMethodType: paymentMethodTypeFromString(map['paymentMethodType']),
    );
  }

}