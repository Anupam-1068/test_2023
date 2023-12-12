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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Enter Amount:'),
              SizedBox(width: 10),
              Flexible(
                child: TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      CurrencyConverter.enteredAmount = double.tryParse(value) ?? 0.0;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              await CurrencyConverter.refresh();
              setState(() {
                // Move this setState inside to trigger UI update
              });
            },
            child: Text('Get Exchanged Amount'),
          ),
          SizedBox(height: 20),
          Text(
            'Converted Amount: ${CurrencyConverter.getConvertedAmount().toStringAsFixed(2)} ${CurrencyConverter.targetCurrency}',
            style: TextStyle(fontSize: 18),
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
              setState(() {});
            },
            child: Text('Swap Currencies'),
          ),
        ],
      ),
    );
  }
}
