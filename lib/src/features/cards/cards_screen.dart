import 'package:flutter/material.dart';

class CardsScreen extends StatefulWidget {
  const CardsScreen({super.key});

  @override
  State<CardsScreen> createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
  final List<Map<String, Object>> _dummyTransactions = [
    {
      'title': 'Coffee Shop',
      'amount': 2500.0,
      'date': '2025-11-25',
      'icon': Icons.local_cafe,
    },
    {
      'title': 'Online Shopping',
      'amount': 12500.0,
      'date': '2025-11-24',
      'icon': Icons.shopping_cart,
    },
    {
      'title': 'Salary',
      'amount': 200000.0,
      'date': '2025-11-23',
      'icon': Icons.attach_money,
    },
    {
      'title': 'Grocery',
      'amount': 7800.0,
      'date': '2025-11-22',
      'icon': Icons.local_grocery_store,
    },
    {
      'title': 'Subscription',
      'amount': 1200.0,
      'date': '2025-11-21',
      'icon': Icons.subscriptions,
    },
  ];

  bool _frozen = false;
  double _limit = 100000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('My Cards'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            // Card
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: _frozen
                      ? [Colors.grey.shade500, Colors.grey.shade700]
                      : [Colors.indigo.shade500, Colors.indigo.shade800],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                leading: const Icon(
                  Icons.credit_card,
                  color: Colors.white,
                  size: 36,
                ),
                title: Text(
                  '**** 1234',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 400),
                  child: Text(
                    _frozen ? 'Frozen' : 'Active',
                    key: ValueKey(_frozen),
                    style: TextStyle(
                      color: _frozen
                          ? Colors.redAccent
                          : Colors.lightGreenAccent,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                trailing: Switch(
                  value: _frozen,
                  activeColor: Colors.redAccent,
                  inactiveThumbColor: Colors.greenAccent,
                  onChanged: (v) => setState(() => _frozen = v),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Spending Limit
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Spending Limit',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '₸${_limit.toStringAsFixed(0)}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    ),
                  ),
                  Slider(
                    min: 0,
                    max: 500000,
                    divisions: 20,
                    value: _limit,
                    activeColor: Colors.indigo,
                    inactiveColor: Colors.indigo.shade100,
                    label: '₸${_limit.toStringAsFixed(0)}',
                    onChanged: (v) => setState(() => _limit = v),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Expense Chart
            Container(
              height: 160,
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.indigo.shade50,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Monthly Expenses',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(6, (index) {
                        final height = (index + 1) * 20.0;
                        return Container(
                          width: 20,
                          height: height,
                          decoration: BoxDecoration(
                            color: Colors.indigo[(index + 2) * 100],
                            borderRadius: BorderRadius.circular(6),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ), // внутри _CardsScreenState build после графика расходов
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(top: 24),
                children: [
                  const Text(
                    'Recent Transactions',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ..._dummyTransactions.map((txn) {
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 2,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.indigo.shade100,
                          child: Icon(
                            txn['icon'] as IconData,
                            color: Colors.indigo,
                          ),
                        ),
                        title: Text(
                          txn['title'] as String,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(txn['date'] as String),
                        trailing: Text(
                          '₸${txn['amount']}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: (txn['amount'] as double) > 0
                                ? Colors.green
                                : Colors.redAccent,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
