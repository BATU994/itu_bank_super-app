import 'package:flutter/material.dart';

class PaymentsScreen extends StatelessWidget {
  const PaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Payments'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Utilities'),
              Tab(text: 'Top-up'),
              Tab(text: 'Internet'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _PaymentsList(category: 'Utilities'),
            _PaymentsList(category: 'Top-up'),
            _PaymentsList(category: 'Internet'),
          ],
        ),
      ),
    );
  }
}

class _PaymentsList extends StatelessWidget {
  final String category;
  const _PaymentsList({required this.category});

  @override
  Widget build(BuildContext context) {
    // Replace with appropriate list per category
    return ListView(
      children: [
        ListTile(leading: const Icon(Icons.receipt), title: Text('$category 1'), trailing: const Text('Paid')), 
        ListTile(leading: const Icon(Icons.receipt), title: Text('$category 2'), trailing: const Text('Due')), 
        ListTile(leading: const Icon(Icons.receipt), title: Text('$category 3'), trailing: const Text('Paid')), 
      ],
    );
  }
}
