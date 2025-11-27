import 'package:flutter/material.dart';

class FeatureTile extends StatelessWidget {
  const FeatureTile({
    super.key,
    required this.icon,
    required this.featureText,
    required this.onTap,
  });
  final Icon icon;
  final String featureText;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 80,
        margin: EdgeInsets.symmetric(horizontal: 16),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.green, // Changed to green
        ),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(25),
              ),
              child: icon,
            ),
            SizedBox(width: 30),
            Text(
              featureText,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Colors.white, // Changed to white
              ),
            ),
          ],
        ),
      ),
    );
  }
}