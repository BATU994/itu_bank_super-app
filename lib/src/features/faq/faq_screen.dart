import 'package:flutter/material.dart';
class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final faqs = [
      {'q': 'How do I reset my password?', 'a': 'Go to settings and choose reset password.'},
      {'q': 'How do I top up?', 'a': 'Go to Payments > Top-up.'},
      {'q': 'Is my money safe?', 'a': 'Yes, all accounts are fully protected.'},
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('FAQ')),
      body: ListView(
        children: faqs.map<Widget>((faq) => ExpansionTile(
          title: Text(faq['q']!),
          children: [Padding(padding: const EdgeInsets.all(12), child: Text(faq['a']!))],
        )).toList(),
      )
    );
  }
}
