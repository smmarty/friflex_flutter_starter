import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.push('/profile');
              },
              child: const Text('Открыть профиль'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.push('/profile_scope');
              },
              child: const Text('Открыть профиль с областью видимости'),
            ),
          ],
        ),
      ),
    );
  }
}
