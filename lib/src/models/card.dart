class BankCard {
  final String id;
  final String maskedNumber;
  bool frozen;
  double limit;
  double spent;

  BankCard({
    required this.id,
    required this.maskedNumber,
    this.frozen = false,
    this.limit = 100000,
    this.spent = 0,
  });
}
