import 'package:bank_application/src/features/card_func/data/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  late Box<TransactionModel> txBox;

  @override
  void initState() {
    super.initState();
    // Open the box (if not already opened)
    txBox = Hive.box<TransactionModel>('transactions');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transaction History')),
      body: ValueListenableBuilder(
        valueListenable: txBox.listenable(),
        builder: (context, Box<TransactionModel> box, _) {
          if (box.isEmpty) {
            return const Center(child: Text('No transactions yet'));
          }

          final transactions = box.values
              .toList()
              .reversed
              .toList(); // newest first

          return ListView.separated(
            itemCount: transactions.length,
            separatorBuilder: (context, index) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final tx = transactions[index];
              return ListTile(
                leading: Icon(
                  tx.amount >= 0 ? Icons.arrow_upward : Icons.arrow_downward,
                  color: tx.amount >= 0 ? Colors.green : Colors.red,
                ),
                title: Text('To: ${tx.receiver16}'),
                subtitle: Text(
                  '${tx.description ?? 'No description'}\n${tx.timestamp.toLocal()}',
                ),
                trailing: Text('\$${tx.amount.toStringAsFixed(2)}'),
                isThreeLine: true,
              );
            },
          );
        },
      ),
    );
  }
}
