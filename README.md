# yandex_checkout

A Yandex Checkout plugin for Flutter. (Note that there is an Android implementation only!)

## Getting Started

To try an example you need to set your own client application key and shop ID
from checkout cabinet to the payment parameters as described below.

Please note that this example doesn't use Yandex Money payment method, so if you need it, you can setup it additionaly as in the docs https://github.com/yandex-money/yandex-checkout-android-sdk#%D0%BF%D0%BE%D0%B4%D0%BA%D0%BB%D1%8E%D1%87%D0%B5%D0%BD%D0%B8%D0%B5-yandexloginsdk


``` dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yandex_checkout/yandex_checkout.dart';

void main() {
  runApp(Example());
}

class Example extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  String resultToken;

  void _createYandexPaymentTokenization() async {
    String displayedMessage;
    final paymentParameters = PaymentParameters(
      title : "Yandex Payment",
      subtitle : "Test",
      amount : Amount(
        value: 100,
        currency: "RUB"
      ),
      // Set your own key
      clientApplicationKey : "<Client Application Key>",
      // Set your own shop id
      shopId : "<Your Shop ID>",
      paymentMethodTypes : {
        PaymentMethodType.BANK_CARD, PaymentMethodType.GOOGLE_PAY,
      }
    );

    try {
      final tokenizationResult = await Checkout.createTokenize(paymentParameters);
      displayedMessage = tokenizationResult.paymentToken;
    } catch (e) {
      displayedMessage = e.toString();
    }

    setState(() => resultToken = displayedMessage);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.yellowAccent,
          accentColor: Colors.yellowAccent
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Example'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.monetization_on),
          onPressed: _createYandexPaymentTokenization,
        ),
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(20),
          child: Text(resultToken ?? "There will be your payment token"),
        ),
      ),
    );
  }
}
```
