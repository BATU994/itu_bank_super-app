import 'package:bank_application/src/features/auth/data/modules/userModel.dart';
import 'package:bank_application/src/features/auth/data/repositories/profile_save.dart';
import 'package:bank_application/src/features/card_func/data/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Transaction extends StatefulWidget {
  const Transaction({super.key});

  @override
  State<Transaction> createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  late UserModel userInfo;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  late int balance;
  @override
  void initState() {
    super.initState();
    loadInfo();
  }

  Future<void> loadInfo() async {
    ProfileInfo prefs = ProfileInfo();
    userInfo = await prefs.getProfileInfo();
    balance = await prefs.getMoney();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Send to card')),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    userInfo.cardNumber.toString(),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text(balance.toString()),
                ],
              ),
            ),
          ),
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text(
                        'Enter the card number',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _cardNumberController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Card number',
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Enter the amount',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _amountController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an amount';
                          }
                          final amount = int.tryParse(value);
                          if (amount == null || amount <= 0) {
                            return 'Please enter a valid amount';
                          }
                          if (amount > balance) {
                            return 'Insufficient balance';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Amount',
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState?.validate() ?? false) {
                            final prefs = ProfileInfo();
                            int amount = int.parse(_amountController.text);
                            balance -= amount;
                            await prefs.changeMoney(balance);
                            final box = Hive.box<TransactionModel>(
                              'transactions',
                            );
                            final tx = TransactionModel(
                              id: DateTime.now().millisecondsSinceEpoch
                                  .toString(),
                              sender16: userInfo.cardNumber
                                  .toString(),
                              receiver16: _cardNumberController.text
                                  .trim(),
                              amount: amount.toDouble(),
                              timestamp: DateTime.now(),
                              description:
                                  "Transfer to ${_cardNumberController.text}",
                            );
                            await box.add(tx);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Transaction sent successfully'),
                              ),
                            );
                            Navigator.pop(context);
                          }
                        },

                        child: Text('Send'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
