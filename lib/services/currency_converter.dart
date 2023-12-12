import '../controllers/currency_controller.dart';
import '../models/models.dart';

class CurrencyConverter {
  static String baseCurrency = 'EUR';
  static String targetCurrency = 'USD';
  static double exchangeRate = 0.0;

  static Future<void> refresh() async {
    try {
      ExchangeRate rate = await CurrencyController.fetchExchangeRate(baseCurrency, targetCurrency);
      exchangeRate = rate.rate;
    } catch (e) {
      // Handle error
      print('Error fetching exchange rate: $e');
    }
  }

  static String getFormattedRate() {
    return exchangeRate.toStringAsFixed(2);
  }
}

