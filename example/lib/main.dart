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
      clientApplicationKey : "<Client Application Key>",
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
