import 'package:bank_application/main.dart';
import 'package:bank_application/src/core/widgets/elevated_custom_button.dart';
import 'package:bank_application/src/features/auth/presentation/widgets/number_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Вход'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Введите номер телефона и пароль, чтобы войти.',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 24),
              NumberField(numberField: _phoneController, validator:(value) {
                if (value == null || value.isEmpty) {
                    return 'Введите номер телефона';
                  }
                  if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                    return 'Номер должен содержать 10 цифр';
                  }
                  return null;
              }),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Пароль',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите пароль';
                  }
                  if (value.length < 6) {
                    return 'Минимум 6 символов';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedCustomButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Вход выполнен')),
                    );
                  }
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MainNavShell()));
                },
                title: 'Войти',
                backColor: Colors.blueAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
