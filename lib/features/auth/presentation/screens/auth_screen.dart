import 'package:flutter/material.dart';

/// {@template AuthScreen}
///
/// {@endtemplate}
class AuthScreen extends StatelessWidget {
  /// {@macro AuthScreen}
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AuthScreen')),
      body: const Center(child: Text('AuthScreen')),
    );
  }
}
