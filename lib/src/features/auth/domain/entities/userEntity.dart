class UserEntity {
  final String number;
  final String password;
  final int cardNumber;
  final String exDate;
  final int cvc;
  UserEntity({
    required this.cardNumber,
    required this.password,
    required this.cvc,
    required this.exDate,
    required this.number,
  });
}
