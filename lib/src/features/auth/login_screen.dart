import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/providers.dart';
import '../../models/user.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  bool _obscure = true;
  bool _loading = false;

  Future<void> _login() async {
    setState(() => _loading = true);
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      // Simulate loading
      await Future.delayed(const Duration(seconds: 1));
      // Persist login
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('loggedIn', true);
      // Set demo user in Riverpod
      ref.read(userProvider.notifier).state = User(
        id: '1',
        name: 'John Doe',
        email: _email,
        locale: 'en',
        balance: 3450000,
      );
      ref.read(authProvider.notifier).state = true;
      if (context.mounted) Navigator.of(context).pop(); // pop login screen
    }
    setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (v) => (v == null || !v.contains('@'))
                    ? 'Enter a valid email'
                    : null,
                onSaved: (v) => _email = v ?? '',
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscure ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () => setState(() => _obscure = !_obscure),
                  ),
                ),
                obscureText: _obscure,
                validator: (v) =>
                    (v == null || v.length < 6) ? 'Min 6 chars' : null,
                onSaved: (v) => _password = v ?? '',
              ),
              const SizedBox(height: 28),
              _loading
                  ? const CircularProgressIndicator()
                  : SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _login,
                        child: const Text('Login'),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
