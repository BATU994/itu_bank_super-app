import 'package:bank_application/src/features/auth/data/modules/userModel.dart';
import 'package:bank_application/src/features/auth/data/repositories/profile_save.dart';
import 'package:bank_application/src/features/card_func/pages/init_page.dart';
import 'package:bank_application/src/features/home/widgets/balance_card.dart';
import 'package:flutter/material.dart';

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
                children: const [
                  _ShortcutButton(icon: Icons.send, label: 'Transfer'),
                  _ShortcutButton(icon: Icons.phone_iphone, label: 'Top-up'),
                  _ShortcutButton(icon: Icons.qr_code, label: 'QR Pay'),
                ],
              ),
              const SizedBox(height: 30),
              Text(
                'Recent Transactions',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Expanded(
                child: ListView(
                  children: const [
                    ListTile(
                      leading: Icon(Icons.arrow_upward, color: Colors.red),
                      title: Text('Sent to John'),
                      trailing: Text('- 20 000 ₸'),
                    ),
                    ListTile(
                      leading: Icon(Icons.arrow_downward, color: Colors.green),
                      title: Text('Received from Anna'),
                      trailing: Text('+ 85 000 ₸'),
                    ),
                  ],
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
