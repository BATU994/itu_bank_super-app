import 'package:bank_application/src/features/auth/data/modules/userModel.dart';
import 'package:bank_application/src/features/auth/data/repositories/profile_save.dart';
import 'package:bank_application/src/features/card_func/pages/history.dart';
import 'package:bank_application/src/features/card_func/pages/transaction.dart';
import 'package:bank_application/src/features/card_func/widgets/init_page/feature_tile.dart';
import 'package:bank_application/src/features/gosuslugi/gos_usligi_page.dart';
import 'package:bank_application/src/features/home/widgets/balance_card.dart';
import 'package:flutter/material.dart';

class InitPage extends StatefulWidget {
  const InitPage({super.key});

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  late UserModel userInfo;
  final int balance = 20000;
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    userInfo = await ProfileInfo().getProfileInfo();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(title: const Text('Card')),
      body: Column(
        children: [
          BalanceCard(balance: balance.toString(), onTap: null),
          SizedBox(height: 20),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              width: double.infinity,
              padding: EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  FeatureTile(
                    icon: Icon(
                      Icons.compare_arrows_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                    featureText: "Транзакции",
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Transaction()),
                    ),
                  ),
                  SizedBox(height: 12),
                  FeatureTile(
                    icon: Icon(
                      Icons.account_balance_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                    featureText: "Оплатить гос.услуги",
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    ),
                  ),
                  SizedBox(height: 12),
                  FeatureTile(
                    icon: Icon(Icons.history_edu, color: Colors.white, size: 30),
                    featureText: "История",
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => History()),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}