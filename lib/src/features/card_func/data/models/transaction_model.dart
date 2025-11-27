import 'package:hive/hive.dart';

part 'transaction_model.g.dart';

@HiveType(typeId: 1)
class TransactionModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String sender16;

  @HiveField(2)
  String receiver16; 

  @HiveField(3)
  double amount;

  @HiveField(4)
  DateTime timestamp;

  @HiveField(5)
  String? description;

  TransactionModel({
    required this.id,
    required this.sender16,
    required this.receiver16,
    required this.amount,
    required this.timestamp,
    this.description,
  });
}
