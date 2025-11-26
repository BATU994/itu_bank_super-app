class CardInfoModule {
  CardInfoModule({
    required this.cardNumber,
    required this.cvc,
    required this.exDate,
  });
  final int cardNumber;
  final String exDate;
  final int cvc;

  factory CardInfoModule.fromJson(Map<String, dynamic> json) {
    return CardInfoModule(
      cardNumber: json['card_number'],
      cvc: json['cvc'],
      exDate: json['ex_date'],
    );
  }
}
