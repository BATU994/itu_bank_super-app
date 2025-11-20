import 'package:flutter/material.dart';

class ElevatedCustomButton extends StatelessWidget {
  const ElevatedCustomButton({
    super.key,
    required this.onPressed,
    required this.title,
    required this.backColor,
  });
  final VoidCallback onPressed;
  final String title;
  final Color backColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 80),
        backgroundColor: backColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
    );
  }
}
