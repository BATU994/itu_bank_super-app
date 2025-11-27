import 'package:flutter/material.dart';

class GovServicesPage extends StatelessWidget {
  const GovServicesPage({super.key});

  final List<Map<String, dynamic>> services = const [
    {'title': 'Оплата налогов', 'icon': Icons.payment, 'color': Colors.blue},
    {
      'title': 'Регистрация бизнеса',
      'icon': Icons.business,
      'color': Colors.orange,
    },
    {'title': 'Паспорт и ID', 'icon': Icons.badge, 'color': Colors.green},
    {
      'title': 'Соц. выплаты',
      'icon': Icons.family_restroom,
      'color': Colors.purple,
    },
    {'title': 'Образование', 'icon': Icons.school, 'color': Colors.teal},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Гос. услуги'),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: services.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 3 / 2,
          ),
          itemBuilder: (context, index) {
            final service = services[index];
            return GestureDetector(
              onTap: () {
                // TODO: navigate to service page
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${service['title']} tapped!')),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      (service['color'] as Color).withOpacity(0.7),
                      service['color'],
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: (service['color'] as Color).withOpacity(0.4),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      service['icon'] as IconData,
                      color: Colors.white,
                      size: 40,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      service['title'] as String,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
