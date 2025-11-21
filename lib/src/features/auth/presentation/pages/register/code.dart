import 'package:bank_application/src/core/widgets/elevated_custom_button.dart';
import 'package:bank_application/src/features/auth/presentation/pages/register/add_card.dart';
import 'package:bank_application/src/features/auth/presentation/pages/register/password.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class CodePage extends StatefulWidget {
  const CodePage({super.key});

  @override
  State<CodePage> createState() => _CodePageState();
}

class _CodePageState extends State<CodePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _pinController = TextEditingController();
  String _code = '';

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final   defaultPinTheme = PinTheme(
      width: 50,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      textStyle: TextStyle(fontSize: 20),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: Colors.blue, width: 2),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Verification'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                'Enter the 6-digit code sent to your phone.',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 24),
                  Pinput(
                    controller: _pinController,
                    length: 6,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: focusedPinTheme,
                    submittedPinTheme: defaultPinTheme,
                    keyboardType: TextInputType.number,
                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                    showCursor: true,
                    onCompleted: (pin) {
                      setState(() {
                        _code = pin;
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                        _code = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 24),
              ElevatedCustomButton(
                onPressed: () {
                  if (_code.length == 6) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (c) => const CreatePasswordPage(),
                      ),
                    );
                  }
                },
                title: 'Verify',
                backColor: Colors.blueAccent,
              )
            ],
          ),
        ),
      ),
    );
  }
}
