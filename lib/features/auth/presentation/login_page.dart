import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_my_pharmacist/features/auth/providers/auth_provider.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authService = ref.watch(authServiceProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Column(
        children: [
          TextField(
            controller: TextEditingController(),
            decoration: InputDecoration(labelText: 'Email'),
          ),
          TextField(
            controller: TextEditingController(),
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          ElevatedButton(
            onPressed: () async {
              await authService.signIn('email@example.com', 'password123');
            },
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}
