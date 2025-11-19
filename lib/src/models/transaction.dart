enum TransactionType { transfer, payment, topup, qrpay, exchange, loan }

class BankTransaction {
  final DateTime date;
  final TransactionType type;
  final String from;
  final String to;
  final double amount;
  final String currency;
  final String description;

  BankTransaction({
    required this.date,
    required this.type,
    required this.from,
    required this.to,
    required this.amount,
    required this.currency,
    required this.description,
  });
}
