import 'package:bank_application/src/features/auth/data/modules/userModel.dart';
import 'package:bank_application/src/features/auth/data/repositories/profile_save.dart';
import 'package:bank_application/src/features/home/widgets/balance_card.dart';
import 'package:flutter/material.dart';

class InitPage extends StatefulWidget {
  const InitPage({super.key});

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    UserModel userInfo = await ProfileInfo().getProfileInfo();
    int balance = await ProfileInfo().getMoney();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Card')),
      body: Column(
        children: const [BalanceCard(balance: "1000", onTap: onTap)],
      ),
    );
  }
}
