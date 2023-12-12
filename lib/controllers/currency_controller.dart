import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/models.dart';

class CurrencyController {
  static final String apiKey = 'fca_live_6maiOaVpasQhCmUdLIAjqhnPw6hyp9tBB9oqXyvI';

  static Future<ExchangeRate> fetchExchangeRate(String baseCurrency, String targetCurrency) async {
    final url = 'https://api.freecurrencyapi.com/v1/latest?apikey=$apiKey&currencies=$baseCurrency,$targetCurrency';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return ExchangeRate.fromJson({
        'base_currency': baseCurrency,
        'target_currency': targetCurrency,
        'rate': data['data']['$baseCurrency$targetCurrency'],
      });
    } else {
      throw Exception('Failed to load exchange rate');
    }
  }
}

