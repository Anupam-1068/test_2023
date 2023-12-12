import '../controllers/currency_controller.dart';
import '../models/models.dart';

class CurrencyConverter {
  static String baseCurrency = 'EUR';
  static String targetCurrency = 'USD';
  static double exchangeRate = 1.0;
  static double enteredAmount = 100.0;


  static Future<void> refresh() async {
    try {
      ExchangeRate rate = (await CurrencyController.fetchExchangeRate(baseCurrency, targetCurrency)) as ExchangeRate;
      exchangeRate = rate.rate;
    } catch (e) {
      // Handle error
      print('Error fetching exchange rate: $e');
    }
  }

  static String getFormattedRate() {
    return exchangeRate.toStringAsFixed(2);
  }

  static double getConvertedAmount() {
    return enteredAmount * exchangeRate;
  }
}



