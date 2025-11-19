import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 4,
                color: Colors.indigo,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Total Balance',
                        style: TextStyle(color: Colors.white70),
                      ),
                      SizedBox(height: 12),
                      Text(
                        ' 3 450 000',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
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
