import 'package:bank_application/src/features/auth/domain/entities/userEntity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.cardNumber,
    required super.password,
    required super.cvc,
    required super.exDate,
    required super.number,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      cardNumber: json['card_number'],
      password: json['password'],
      cvc: json['cvc'],
      exDate: json['ex_date'],
      number: json['number'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "card_number": cardNumber,
      "password": password,
      "cvc": cvc,
      "ex_date": exDate,
      "number": number,
    };
  }
}

class UserUI {
  UserUI({required this.cardNumber, required this.number});
  final int cardNumber;
  final String number;

  UserUI toUI(UserEntity entity) {
    return UserUI(number: entity.number, cardNumber: entity.cardNumber);
  }
}
