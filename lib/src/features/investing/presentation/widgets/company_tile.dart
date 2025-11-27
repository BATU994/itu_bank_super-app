import 'package:flutter/material.dart';

class CompanyTile extends StatelessWidget {
  const CompanyTile({super.key, required this.item});
  final Map<String, dynamic> item;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),

      child: Column(
        children: [
          Text(item['company_name']),
          Text(item['price'].toString()),
          Text(item['change_percent'].toString()),
          Text(item['currency'].toString()),
          Text(item['date'].toString()),
        ],
      ),
    );
  }
}
