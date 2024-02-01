import 'package:flutter/material.dart';
import 'package:walletapp/feature/auth/widgets/auth_widget.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: AuthWidget(),
    );
  }
}
