import 'package:flutter/material.dart';

class QRPaymentScreen extends StatefulWidget {
  const QRPaymentScreen({super.key});

  @override
  State<QRPaymentScreen> createState() => _QRPaymentScreenState();
}

class _QRPaymentScreenState extends State<QRPaymentScreen> {
  bool scanned = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('QR Payment')),
      body: Center(
        child: !scanned
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.qr_code_scanner,
                    size: 130,
                    color: Colors.indigo,
                  ),
                  const SizedBox(height: 26),
                  ElevatedButton(
                    onPressed: () => setState(() => scanned = true),
                    child: const Text('Scan QR Code'),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.check_circle, color: Colors.green, size: 80),
                  SizedBox(height: 18),
                  Text('Payment to "Dastan Coffee"'),
                  Text(
                    '- 2 500 ₸',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  SizedBox(height: 18),
                  Text(
                    'Payment successful!',
                    style: TextStyle(color: Colors.green),
                  ),
                ],
              ),
      ),
    );
  }
}
