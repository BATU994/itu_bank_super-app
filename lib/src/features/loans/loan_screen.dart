import 'package:flutter/material.dart';

class LoanScreen extends StatelessWidget {
  const LoanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Loans')),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Loan Status',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 18),
            Card(
              child: ListTile(
                leading: const Icon(Icons.monetization_on),
                title: const Text('Personal Loan'),
                subtitle: const Text('10%, KZT, 36 mo.'),
                trailing: const Text('Active'),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Apply for Loan',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            TextField(
              decoration: const InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 8),
            TextField(decoration: const InputDecoration(labelText: 'Comment')),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Apply'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
