import 'dart:io';

import 'package:flutter/material.dart';
import 'package:netflix_app/alert_dialog/custom_dialog_factory.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback? onLogin;
  const LoginPage({super.key, this.onLogin});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final emailController = TextEditingController();
  late final passwordController = TextEditingController();

  bool get _isEmailValid =>
      emailController.text.isNotEmpty && emailController.text.contains('@');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
                  } else {
                    _showErrorDialog();
                  }
                },
                child: const Text('Login')),
          ],
        ),
      ),
    );
  }

  void _showErrorDialog() => showDialog(
        context: context,
        builder: (context) => CustomDialogFactory(
          key: Key('error-dialog'),
          title: Text('Aviso!'),
          content: Text('Digite o email ou a senha corretamente'),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context), child: Text('OK'))
          ],
        ).buildDialog(isAndroid: false),
      );
}
