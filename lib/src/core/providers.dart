import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user.dart';
import '../models/card.dart';
import '../models/transaction.dart';

final authProvider = StateProvider<bool>((ref) => false); // logged in status
final userProvider = StateProvider<User?>((ref) => null);
final balanceProvider = StateProvider<double>((ref) => 3450000);
final transactionsProvider =
    StateNotifierProvider<TransactionsNotifier, List<BankTransaction>>(
      (ref) => TransactionsNotifier(),
    );
final cardsProvider = StateNotifierProvider<CardsNotifier, List<BankCard>>(
  (ref) => CardsNotifier(),
);
final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.system);
final localeProvider = StateProvider<String>((ref) => 'en');

class TransactionsNotifier extends StateNotifier<List<BankTransaction>> {
  TransactionsNotifier() : super([]);
  void add(BankTransaction txn) => state = [...state, txn];
  void clear() => state = [];
}

class CardsNotifier extends StateNotifier<List<BankCard>> {
  CardsNotifier()
    : super([
        BankCard(id: '1', maskedNumber: '**** 1234'),
        BankCard(id: '2', maskedNumber: '**** 9876', frozen: true),
      ]);
  void setFrozen(String cardId, bool frozen) {
    state = [
      for (final c in state)
        if (c.id == cardId)
          BankCard(
            id: c.id,
            maskedNumber: c.maskedNumber,
            frozen: frozen,
            limit: c.limit,
            spent: c.spent,
          )
        else
          c,
    ];
  }

  void updateLimit(String cardId, double limit) {
    state = [
      for (final c in state)
        if (c.id == cardId)
          BankCard(
            id: c.id,
            maskedNumber: c.maskedNumber,
            frozen: c.frozen,
            limit: limit,
            spent: c.spent,
          )
        else
          c,
    ];
  }
}
