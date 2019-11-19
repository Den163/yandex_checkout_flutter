import 'package:meta/meta.dart';

class Amount {
  final double value;
  final String currency;

  const Amount({
    @required this.value,
    @required this.currency,
  });

  @override
  bool operator ==(Object other) =>
    identical(this, other) ||
      (other is Amount &&
          runtimeType == other.runtimeType &&
          value == other.value &&
          currency == other.currency
      );

  @override
  int get hashCode =>
      value.hashCode ^
      currency.hashCode;

  @override
  String toString() {
    return 'Amount{' +
        ' value: $value,' +
        ' currency: $currency,' +
        '}';
  }

  Amount copyWith({
    double value,
    String currency,
  }) {
    return new Amount(
      value: value ?? this.value,
      currency: currency ?? this.currency,
    );
  }

  Map toMap() {
    return {
      'value': this.value,
      'currency': this.currency,
    };
  }

  factory Amount.fromMap(Map map) {
    if (map == null) return null;

    return new Amount(
      value: map['value'] as double,
      currency: map['currency'] as String,
    );
  }
}