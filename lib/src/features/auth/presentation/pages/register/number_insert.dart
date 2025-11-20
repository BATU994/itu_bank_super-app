import 'package:bank_application/src/core/widgets/elevated_custom_button.dart';
import 'package:bank_application/src/features/auth/presentation/pages/register/code.dart';
import 'package:bank_application/src/features/auth/presentation/pages/login/login.dart';
import 'package:bank_application/src/features/auth/presentation/widgets/number_field.dart';
import 'package:flutter/material.dart';

class NumberInsert extends StatefulWidget {
  const NumberInsert({super.key});

  @override
  State<NumberInsert> createState() => _NumberInsertState();
}

class _NumberInsertState extends State<NumberInsert> {
  TextEditingController numberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Registration')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Напишите свой номер чтобы продолжить',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 12),
              NumberField(
                numberField: numberController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Phone number is required';
                  }
                  if (value.length != 10) {
                    return 'Phone number must be 10 digits';
                  }
                  if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                    return 'Only digits are allowed';
                  }
                  return null;
                },
              ),
              SizedBox(height: 12),
              Text(
                'Мы отправим код на ваш номер',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedCustomButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CodePage()),
                        );
                      }
                    },
                    title: 'Подтвердить',
                    backColor: Colors.blueAccent,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
                      );
                    },
                    child: const Text('Уже есть аккаунт? Войти'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
