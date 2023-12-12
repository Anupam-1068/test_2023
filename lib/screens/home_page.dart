import 'package:flutter/material.dart';
import '../services/currency_converter.dart';
import '../widgets/currency_converter_widget.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Currency Converter'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              CurrencyConverter.refresh();
            },
          ),
        ],
      ),
      body: CurrencyConverterWidget(),
    );
  }
}
