import 'package:yandex_checkout/src/amount.dart';
import 'package:yandex_checkout/src/google_pay_parameters.dart';
import 'package:yandex_checkout/src/payment_method_type.dart';
import 'package:meta/meta.dart';

class PaymentParameters {
  final String title;
  final String subtitle;
  final Amount amount;
  final String clientApplicationKey;
  final String shopId;
  final Set<PaymentMethodType> paymentMethodTypes;
  final String gatewayId;
  final String customReturnUrl;
  final String userPhoneNumber;
  final GooglePayParameters googlePayParameters;

  const PaymentParameters({
    @required this.title,
    @required this.subtitle,
    @required this.amount,
    @required this.clientApplicationKey,
    @required this.shopId,
    this.paymentMethodTypes,
    this.gatewayId,
    this.customReturnUrl,
    this.userPhoneNumber,
    this.googlePayParameters,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PaymentParameters &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          subtitle == other.subtitle &&
          amount == other.amount &&
          clientApplicationKey == other.clientApplicationKey &&
          shopId == other.shopId &&
          paymentMethodTypes == other.paymentMethodTypes &&
          gatewayId == other.gatewayId &&
          customReturnUrl == other.customReturnUrl &&
          userPhoneNumber == other.userPhoneNumber &&
          googlePayParameters == other.googlePayParameters);

  @override
  int get hashCode =>
      title.hashCode ^
      subtitle.hashCode ^
      amount.hashCode ^
      clientApplicationKey.hashCode ^
      shopId.hashCode ^
      paymentMethodTypes.hashCode ^
      gatewayId.hashCode ^
      customReturnUrl.hashCode ^
      userPhoneNumber.hashCode ^
      googlePayParameters.hashCode;

  @override
  String toString() {
    return 'PaymentParameters{' +
        ' title: $title,' +
        ' subtitle: $subtitle,' +
        ' amount: $amount,' +
        ' clientApplicationKey: $clientApplicationKey,' +
        ' shopId: $shopId,' +
        ' paymentMethodTypes: $paymentMethodTypes,' +
        ' gatewayId: $gatewayId,' +
        ' customReturnUrl: $customReturnUrl,' +
        ' userPhoneNumber: $userPhoneNumber,' +
        ' googlePayParameters: $googlePayParameters,' +
        '}';
  }

  PaymentParameters copyWith({
    String title,
    String subtitle,
    Amount amount,
    String clientApplicationKey,
    String shopId,
    Set<PaymentMethodType> paymentMethodTypes,
    String gatewayId,
    String customReturnUrl,
    String userPhoneNumber,
    GooglePayParameters googlePayParameters,
  }) {
    return new PaymentParameters(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      amount: amount ?? this.amount,
      clientApplicationKey: clientApplicationKey ?? this.clientApplicationKey,
      shopId: shopId ?? this.shopId,
      paymentMethodTypes: paymentMethodTypes ?? this.paymentMethodTypes,
      gatewayId: gatewayId ?? this.gatewayId,
      customReturnUrl: customReturnUrl ?? this.customReturnUrl,
      userPhoneNumber: userPhoneNumber ?? this.userPhoneNumber,
      googlePayParameters: googlePayParameters ?? this.googlePayParameters,
    );
  }

  Map toMap() {
    return {
      'title': this.title,
      'subtitle': this.subtitle,
      'amount': this.amount?.toMap(),
      'clientApplicationKey': this.clientApplicationKey,
      'shopId': this.shopId,
      'paymentMethodTypes': this.paymentMethodTypes
        ?.map((p) => paymentMethodTypeToString(p))
        ?.toList(),
      'gatewayId': this.gatewayId,
      'customReturnUrl': this.customReturnUrl,
      'userPhoneNumber': this.userPhoneNumber,
      'googlePayParameters': this.googlePayParameters?.toMap(),
    };
  }

  factory PaymentParameters.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return new PaymentParameters(
      title: map['title'] as String,
      subtitle: map['subtitle'] as String,
      amount: Amount.fromMap(map['amount']),
      clientApplicationKey: map['clientApplicationKey'] as String,
      shopId: map['shopId'] as String,
      paymentMethodTypes: (map['paymentMethodTypes'] as List)
        ?.map((p) => paymentMethodTypeFromString(p))
        ?.toSet(),
      gatewayId: map['gatewayId'] as String,
      customReturnUrl: map['customReturnUrl'] as String,
      userPhoneNumber: map['userPhoneNumber'] as String,
      googlePayParameters:
        GooglePayParameters.fromMap(map['googlePayParameters']),
    );
  }
}
