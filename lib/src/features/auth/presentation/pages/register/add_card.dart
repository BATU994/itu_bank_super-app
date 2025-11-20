import 'package:bank_application/main.dart';
import 'package:bank_application/src/core/widgets/elevated_custom_button.dart';
import 'package:flutter/material.dart';
import 'package:bank_application/src/features/auth/presentation/widgets/register/card_details_fields.dart';

class AddCardPage extends StatefulWidget {
  const AddCardPage({super.key});

  @override
  State<AddCardPage> createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvcController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Add card')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter your card details',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 24),
              CardDetailsFields(
                cardNumberController: _cardNumberController,
                expiryDateController: _expiryDateController,
                cvcController: _cvcController,
              ),
              SizedBox(height: 24),
              ElevatedCustomButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    FocusScope.of(context).unfocus();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MainNavShell()));
                  }
                },
                title: 'Add card',
                backColor: Colors.blueAccent,
              )
            ],
          ),
        ),
      ),
    );
  }
}