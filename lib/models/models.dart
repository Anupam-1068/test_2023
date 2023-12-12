class ExchangeRate {
  final String baseCurrency;
  final String targetCurrency;
  final double rate;

  ExchangeRate({
    required this.baseCurrency,
    required this.targetCurrency,
    required this.rate,
  });

  factory ExchangeRate.fromJson(Map<String, dynamic> json) {
    return ExchangeRate(
      baseCurrency: json['base_currency'],
      targetCurrency: json['target_currency'],
      rate: json['rate'],
    );
  }
}
