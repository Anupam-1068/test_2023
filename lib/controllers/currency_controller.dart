import 'dart:convert';
import 'package:http/http.dart' as http;

class CurrencyController {
  static const String apiKey = 'fca_live_6maiOaVpasQhCmUdLIAjqhnPw6hyp9tBB9oqXyvI';
  static const String baseUrl = 'https://api.freecurrencyapi.com/v1/latest';

  static Future<double?> fetchExchangeRate(String baseCurrency, String targetCurrency) async {
    final url = '$baseUrl?apikey=$apiKey&currencies=$baseCurrency';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final rates = data['data']['rates'];
        final baseToTargetRate = rates[targetCurrency];

        if (baseToTargetRate != null) {
          return baseToTargetRate.toDouble();
        } else {
          throw Exception('Invalid exchange rates for currencies: $baseCurrency, $targetCurrency');
        }
      } else {
        throw Exception('Failed to load exchange rate');
      }
    } catch (e) {
      print('Error fetching exchange rate: $e');
      return null;
    }
  }
}
