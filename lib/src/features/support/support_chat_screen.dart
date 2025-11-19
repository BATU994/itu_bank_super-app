import 'package:flutter/material.dart';
class SupportChatScreen extends StatelessWidget {
  const SupportChatScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Support Chat')),
    body: ListView(
      padding: const EdgeInsets.all(20),
      children: const [
        Align(
          alignment: Alignment.centerLeft,
          child: Card(color: Colors.grey, child: Padding(padding: EdgeInsets.all(8), child: Text('How can I help you?')))
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Card(color: Colors.indigo, child: Padding(padding: EdgeInsets.all(8), child: Text('I have a problem', style: TextStyle(color: Colors.white))))
        )
      ],
    ),
  );
}
