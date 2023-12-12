import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../services/currency_converter.dart';

class CurrencyConverterWidget extends StatefulWidget {
  @override
  _CurrencyConverterWidgetState createState() => _CurrencyConverterWidgetState();
}

class _CurrencyConverterWidgetState extends State<CurrencyConverterWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '1 ${CurrencyConverter.baseCurrency} = ${CurrencyConverter.getFormattedRate()} ${CurrencyConverter.targetCurrency}',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              // Swap currencies
              setState(() {
                final temp = CurrencyConverter.baseCurrency;
                CurrencyConverter.baseCurrency = CurrencyConverter.targetCurrency;
                CurrencyConverter.targetCurrency = temp;
              });
              // Refresh exchange rate after swapping
              await CurrencyConverter.refresh();
            },
            child: Text('Swap Currencies'),
          ),
        ],
      ),
    );
  }
}