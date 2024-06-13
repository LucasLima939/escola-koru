import 'package:flutter/material.dart';
import 'package:netflix_app/alert_dialog/custom_dialog_factory.dart';
import 'package:netflix_app/login_mvc/login_controller.dart';

class LoginView extends StatefulWidget {
  final VoidCallback? onLogin;
  const LoginView({super.key, this.onLogin});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final controller = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(onChanged: controller.addEmail),
            const SizedBox(height: 10),
            TextFormField(onChanged: controller.addPassword),
            const SizedBox(height: 10),
            StreamBuilder(
              stream: controller.formValidatedStream,
              builder: (context, snapshot) {
                final isValid = snapshot.data;
                return TextButton(
                  key: const Key('login-button'),
                  onPressed:
                      isValid == true ? () => controller.submitForm() : null,
                  child: const Text('Login'),
                );
              },
            ),
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
