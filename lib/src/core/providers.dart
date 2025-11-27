import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user.dart';
import '../models/card.dart';
import '../models/transaction.dart';
import 'package:shared_preferences/shared_preferences.dart';

final authProvider = StateProvider<bool>((ref) => false);
final userProvider = StateProvider<User?>((ref) => null);
final balanceProvider = StateProvider<double>((ref) => 3450000);
final transactionsProvider =
    StateNotifierProvider<TransactionsNotifier, List<BankTransaction>>(
      (ref) => TransactionsNotifier(),
    );
final cardsProvider = StateNotifierProvider<CardsNotifier, List<BankCard>>(
  (ref) => CardsNotifier(),
);
final themeModeProvider = StateNotifierProvider<ThemeModeNotifier, ThemeMode>(
  (ref) => ThemeModeNotifier(),
);
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

class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  ThemeModeNotifier() : super(ThemeMode.system) {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final themeString = prefs.getString('themeMode') ?? 'system';
    switch (themeString) {
      case 'light':
        state = ThemeMode.light;
        break;
      case 'dark':
        state = ThemeMode.dark;
        break;
      default:
        state = ThemeMode.system;
    }
  }

  void setTheme(ThemeMode mode) async {
    state = mode;
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('themeMode', mode.name);
  }
}
