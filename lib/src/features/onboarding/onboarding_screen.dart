import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: const [
          OnboardSlide(
            title: 'Welcome',
            description: 'A modern banking experience.',
            color: Colors.blueAccent,
          ),
          OnboardSlide(
            title: 'Secure',
            description: 'Your data, safely protected.',
            color: Colors.greenAccent,
          ),
          OnboardSlide(
            title: 'Get Started',
            description: 'Open an account in minutes.',
            color: Colors.deepPurpleAccent,
          ),
        ],
      ),
    );
  }
}

class OnboardSlide extends StatelessWidget {
  final String title;
  final String description;
  final Color color;

  const OnboardSlide({
    required this.title,
    required this.description,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color.withOpacity(0.1),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(height: 24),
            Text(description, style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}
