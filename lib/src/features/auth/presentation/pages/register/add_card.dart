import 'package:bank_application/main.dart';
import 'package:bank_application/src/core/widgets/elevated_custom_button.dart';
import 'package:bank_application/src/features/auth/data/repositories/profile_save.dart';
import 'package:flutter/material.dart';
import 'package:bank_application/src/features/auth/presentation/widgets/register/card_details_fields.dart';

class AddCardPage extends StatefulWidget {
  const AddCardPage({super.key, required this.password, required this.number});
  final String password;
  final String number;

  @override
  State<AddCardPage> createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvcController = TextEditingController();
  final prefs = ProfileInfo();
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
                backColor: Colors.blue,
                title: 'click',
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    FocusScope.of(context).unfocus();
                    prefs.saveProfileInfo(
                      widget.number,
                      widget.password,
                      int.parse(_cardNumberController.text),
                      _expiryDateController.text,
                      int.parse(_cvcController.text),
                      100000,
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainNavShell()),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
