import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/models.dart';

class CurrencyController {
  static Future<ExchangeRate> fetchExchangeRate(String baseCurrency, String targetCurrency) async {
    final response = await http.get(
      Uri.parse('https://www.freecurrencyapi.com/api/v1/rates?base_currency=$baseCurrency'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return ExchangeRate.fromJson({
        'base_currency': baseCurrency,
        'target_currency': targetCurrency,
        'rate': data['data']['rates'][targetCurrency],
      });
    } else {
      throw Exception('Failed to load exchange rate');
    }
  }
}
