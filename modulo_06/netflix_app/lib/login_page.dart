import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback? onLogin;
  const LoginPage({super.key, this.onLogin});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final emailController = TextEditingController();
  late final passwordController = TextEditingController();

  bool get _isEmailValid => emailController.text.isNotEmpty && emailController.text.contains('@');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextFormField(
              controller: emailController,
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: passwordController,
            ),
            const SizedBox(height: 10),
            TextButton(
                key: const Key('login-button'),
                onPressed: () {
                  if (_isEmailValid && passwordController.text.isNotEmpty) {
                    widget.onLogin?.call();
                  }
                },
                child: const Text('Login')),
          ],
        ),
      ),
    );
  }
}
