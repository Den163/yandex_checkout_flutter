import 'package:yandex_checkout/src/google_pay_card_network.dart';
import 'package:meta/meta.dart';

class GooglePayParameters {
  final Set<GooglePayCardNetwork> allowedCardNetworks;

  const GooglePayParameters({
    @required this.allowedCardNetworks,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GooglePayParameters &&
          runtimeType == other.runtimeType &&
          allowedCardNetworks == other.allowedCardNetworks);

  @override
  int get hashCode => allowedCardNetworks.hashCode;

  @override
  String toString() {
    return 'GooglePayParameters{' +
        ' allowedCardNetworks: $allowedCardNetworks,' +
        '}';
  }

  GooglePayParameters copyWith({
    Set<GooglePayCardNetwork> allowedCardNetworks,
  }) {
    return new GooglePayParameters(
      allowedCardNetworks: allowedCardNetworks ?? this.allowedCardNetworks,
    );
  }

  Map toMap() {
    return {
      'allowedCardNetworks': this.allowedCardNetworks
        .map((c) => googlePayCardNetworkToString(c)).toList() ,
    };
  }

  factory GooglePayParameters.fromMap(Map map) {
    return new GooglePayParameters(
      allowedCardNetworks:
        (map['allowedCardNetworks'] as List)
          .map((c) => googlePayCardNetworkFromString(c))
          .toSet(),
    );
  }
}
