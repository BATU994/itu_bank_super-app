import 'package:bank_application/src/features/auth/data/modules/userModel.dart';
import 'package:bank_application/src/features/auth/data/repositories/profile_save.dart';
import 'package:bank_application/src/features/card_func/data/models/transaction_model.dart';
import 'package:bank_application/src/features/card_func/pages/init_page.dart';
import 'package:bank_application/src/features/card_func/pages/transaction.dart';
import 'package:bank_application/src/features/home/widgets/balance_card.dart';
import 'package:bank_application/src/features/qr/qr_payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late UserModel userInfo;
  final int balance = 20;
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    ProfileInfo prefs = ProfileInfo();
    userInfo = await prefs.getProfileInfo();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Text(
                'Good afternoon!',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 12),
              BalanceCard(
                balance: "20000",
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InitPage()),
                ),
              ),
              const SizedBox(height: 22),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () => Transaction(),
                    child: _ShortcutButton(icon: Icons.send, label: 'Transfer'),
                  ),
                  GestureDetector(
                    onTap: () => QRScannerScreen(),
                    child: _ShortcutButton(
                      icon: Icons.qr_code,
                      label: 'QR Pay',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Text(
                'Recent Transactions',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: Hive.box<TransactionModel>(
                    'transactions',
                  ).listenable(),
                  builder: (context, Box<TransactionModel> box, _) {
                    if (box.isEmpty) {
                      return Center(child: Text('No transactions yet'));
                    }

                    // Get transactions and reverse to show newest first
                    final transactions = box.values.toList().reversed.toList();

                    return ListView.builder(
                      itemCount: transactions.length,
                      itemBuilder: (context, index) {
                        final tx = transactions[index];
                        final isReceived =
                            tx.receiver16 == userInfo.cardNumber.toString();

                        return ListTile(
                          leading: Icon(
                            isReceived
                                ? Icons.arrow_downward
                                : Icons.arrow_upward,
                            color: isReceived ? Colors.green : Colors.red,
                          ),
                          title: Text(
                            tx.description ??
                                (isReceived ? 'Received' : 'Sent'),
                          ),
                          subtitle: Text(
                            '${tx.timestamp.day}/${tx.timestamp.month}/${tx.timestamp.year}',
                          ),
                          trailing: Text(
                            '${isReceived ? '+' : '-'} ${tx.amount.toStringAsFixed(0)} ₸',
                            style: TextStyle(
                              color: isReceived ? Colors.green : Colors.red,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ShortcutButton extends StatelessWidget {
  final IconData icon;
  final String label;
  const _ShortcutButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) => Column(
    children: [
      CircleAvatar(
        radius: 26,
        backgroundColor: Colors.indigo,
        child: Icon(icon, color: Colors.white),
      ),
      const SizedBox(height: 8),
      Text(label, style: const TextStyle(fontSize: 13)),
    ],
  );
}
