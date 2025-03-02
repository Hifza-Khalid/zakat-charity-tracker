class ZakatModel {
  double assets;
  double liabilities;
  double zakatAmount;

  ZakatModel({required this.assets, required this.liabilities, required this.zakatAmount});

  // Convert to JSON (for storing in local storage)
  Map<String, dynamic> toJson() {
    return {
      'assets': assets,
      'liabilities': liabilities,
      'zakatAmount': zakatAmount,
    };
  }

  // Convert from JSON
  factory ZakatModel.fromJson(Map<String, dynamic> json) {
    return ZakatModel(
      assets: json['assets'],
      liabilities: json['liabilities'],
      zakatAmount: json['zakatAmount'],
    );
  }
}
