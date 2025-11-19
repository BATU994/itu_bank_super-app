import 'package:flutter/material.dart';

class CardsScreen extends StatefulWidget {
  const CardsScreen({super.key});

  @override
  State<CardsScreen> createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
  bool _frozen = false;
  double _limit = 100000;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Cards')),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Card(
              color: _frozen ? Colors.grey : Colors.indigo,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: ListTile(
                leading: const Icon(Icons.credit_card, color: Colors.white),
                title: const Text('**** 1234', style: TextStyle(color: Colors.white)),
                subtitle: Text(_frozen ? 'Frozen' : 'Active', style: TextStyle(color: _frozen ? Colors.redAccent : Colors.lightGreenAccent)),
                trailing: Switch(value: _frozen, onChanged: (v) => setState(() => _frozen = v)),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.lock),
              title: const Text('Spending Limit'),
              subtitle: Text('₸${_limit.toStringAsFixed(0)}'),
              trailing: SizedBox(
                width: 120,
                child: Slider(
                  min: 0,max: 500000,divisions: 10,value: _limit,
                  onChanged: (v) => setState(() => _limit = v),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const _ExpenseChart(),
          ],
        ),
      ),
    );
  }
}

class _ExpenseChart extends StatelessWidget {
  const _ExpenseChart();
  @override
  Widget build(BuildContext context) {
    // Just a placeholder, replace with a real chart for a real app.
    return Container(
      height: 140,
      width: double.infinity,
      color: Colors.indigo.shade50,
      alignment: Alignment.center,
      child: const Text('Expense Chart (Demo)', style: TextStyle(color: Colors.indigo)),
    );
  }
}
