enum PaymentMethodType {
  YANDEX_MONEY,
  BANK_CARD,
  SBERBANK,
  GOOGLE_PAY
}

final _stringToValue = Map<String, PaymentMethodType>.fromIterable(
    PaymentMethodType.values,
    key: (v) => v.toString().replaceFirst("PaymentMethodType.", ""),
    value: (v) => v);

PaymentMethodType paymentMethodTypeFromString(String string) =>
  _stringToValue[string];

String paymentMethodTypeToString(PaymentMethodType paymentMethodType) =>
  _stringToValue
    .entries
    .firstWhere((p) => p.value == paymentMethodType)
    .key;