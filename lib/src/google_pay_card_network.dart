
enum GooglePayCardNetwork {
  AMEX,
  DISCOVER,
  JCB,
  MASTERCARD,
  VISA,
  INTERAC,
  OTHER
}

final _stringToValue = Map<String, GooglePayCardNetwork>.fromIterable(
  GooglePayCardNetwork.values,
  key: (k) => k.toString().replaceFirst("GooglePayCardNetwork.", ""),
  value: (v) => v
);

GooglePayCardNetwork googlePayCardNetworkFromString(String string) =>
  _stringToValue[string];

String googlePayCardNetworkToString(GooglePayCardNetwork googlePayCardNetwork) =>
  _stringToValue
    .entries
    .firstWhere((e) => e.value == googlePayCardNetwork)
    .key;