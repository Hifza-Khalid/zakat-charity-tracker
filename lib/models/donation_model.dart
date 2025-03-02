class DonationModel {
  String organization;
  double amount;
  DateTime date;

  DonationModel({required this.organization, required this.amount, required this.date});

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'organization': organization,
      'amount': amount,
      'date': date.toIso8601String(),
    };
  }

  // Convert from JSON
  factory DonationModel.fromJson(Map<String, dynamic> json) {
    return DonationModel(
      organization: json['organization'],
      amount: json['amount'],
      date: DateTime.parse(json['date']),
    );
  }
}
