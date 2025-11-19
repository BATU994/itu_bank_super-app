import 'package:flutter/material.dart';

class IntegrationsScreen extends StatelessWidget {
  const IntegrationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Integrations')),
      body: ListView(
        padding: const EdgeInsets.all(14.0),
        children: [
          SwitchListTile(
            secondary: const Icon(Icons.local_taxi),
            title: const Text('Taxi Payments'),
            value: true,
            onChanged: (_) {},
          ),
          SwitchListTile(
            secondary: const Icon(Icons.bar_chart),
            title: const Text('Brokerage Connect'),
            value: false,
            onChanged: (_) {},
          ),
          SwitchListTile(
            secondary: const Icon(Icons.fastfood),
            title: const Text('Food Delivery'),
            value: true,
            onChanged: (_) {},
          ),
        ],
      ),
    );
  }
}
