import 'package:flutter/material.dart';

class NumberField extends StatelessWidget {
  const NumberField(
      {super.key, required this.numberField, required this.validator});
  final TextEditingController numberField;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '+7',
              style: TextStyle(fontSize: 38),
            ),
            SizedBox(width: 8),
            VerticalDivider(
              color: Colors.grey.shade400,
              thickness: 1,
              width: 16,
            ),
            SizedBox(width: 8),
            Expanded(
              child: TextFormField(
                controller: numberField,
                validator: validator,
                keyboardType: TextInputType.number,
                maxLength: 10,
                style: TextStyle(fontSize: 40),
                decoration: InputDecoration(
                  counterText: '',
                  hintText: '000 000 00 00',
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
