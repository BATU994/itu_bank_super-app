import 'package:bank_application/src/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/providers.dart';
import 'package:bank_application/l10n/app_localizations.dart';

class TransactionHistoryScreen extends ConsumerWidget {
  const TransactionHistoryScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final txs = ref.watch(transactionsProvider).reversed.toList();
    return Scaffold(
      appBar: AppBar(title: Text(l10n.recentTransactions)),
      body: txs.isEmpty
          ? Center(child: Text(l10n.noTransactions))
          : ListView.builder(
              itemCount: txs.length,
              padding: const EdgeInsets.only(top: 18, left: 12, right: 12),
              itemBuilder: (ctx, i) {
                final t = txs[i];
                final isIn =
                    t.type == TransactionType.loan ||
                    t.type == TransactionType.topup;
                return ListTile(
                  leading: Icon(
                    isIn ? Icons.call_received : Icons.call_made,
                    color: isIn ? Colors.green : Colors.red,
                  ),
                  title: Text('${t.description}'),
                  subtitle: Text(
                    '${t.date.day}.${t.date.month}.${t.date.year}',
                  ),
                  trailing: Text(
                    (isIn ? '+' : '-') + '₸${t.amount.toStringAsFixed(0)}',
                    style: TextStyle(color: isIn ? Colors.green : Colors.red),
                  ),
                );
              },
            ),
    );
  }
}
