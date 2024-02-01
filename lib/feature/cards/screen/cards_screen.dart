import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Card Screen",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}