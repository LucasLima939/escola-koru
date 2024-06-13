import 'package:flutter/material.dart';
import 'package:netflix_app/alert_dialog/custom_dialog_factory.dart';
import 'package:netflix_app/login_mvp/login_presenter.dart';

class LoginView extends StatefulWidget {
  final VoidCallback? onLogin;
  const LoginView({super.key, this.onLogin});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final emailController = TextEditingController()
    ..addListener(verifyFormListener);
  late final passwordController = TextEditingController()
    ..addListener(verifyFormListener);
  final presenter = LoginPresenter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(controller: emailController),
            const SizedBox(height: 10),
            TextFormField(controller: passwordController),
            const SizedBox(height: 10),
            StreamBuilder(
              stream: presenter.isFormValidStream,
              builder: (context, snapshot) {
                final isValid = snapshot.data;
                return TextButton(
                  key: const Key('login-button'),
                  onPressed: isValid == true
                      ? () => presenter.submitForm(
                            emailController.text,
                            passwordController.text,
                          )
                      : null,
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

  void verifyFormListener() =>
      presenter.verifyForm(emailController.text, passwordController.text);
}
