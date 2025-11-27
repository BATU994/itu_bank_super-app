import 'package:flutter/material.dart';

class InvestmentDetailPage extends StatelessWidget {
  final Map<String, dynamic> company;
  const InvestmentDetailPage({super.key, required this.company});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          company['company_name'],
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 36,
                  backgroundColor: Colors.blueGrey.shade50,
                  child: Text(
                    company['ticker'][0],
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        company['ticker'],
                        style: theme.textTheme.titleLarge,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        company['company_name'],
                        style: theme.textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            _infoRow(
              'Price:',
              '${company['price']} ${company['currency']}',
              theme,
            ),
            _infoRow(
              'Change %:',
              '${(company['change_percent'] as double).toStringAsFixed(2)}%',
              theme,
              color: (company['change_percent'] >= 0
                  ? Colors.green
                  : Colors.red),
            ),
            _infoRow('Date:', company['date'], theme),
            if (company.containsKey('description')) ...[
              const SizedBox(height: 24),
              Text('Company Description', style: theme.textTheme.titleMedium),
              const SizedBox(height: 4),
              Text(company['description'], style: theme.textTheme.bodyLarge),
            ],
            // Add more fields if needed
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String label, String value, ThemeData theme, {Color? color}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Text(
            label,
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 10),
          Text(value, style: theme.textTheme.bodyLarge?.copyWith(color: color)),
        ],
      ),
    );
  }
}
