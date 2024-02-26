import 'package:flutter/material.dart';

class CardDetails extends StatelessWidget {
  final String? cardId;
  const CardDetails({super.key, required this.cardId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          cardId!,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
