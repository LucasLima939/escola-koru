import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:netflix_app/login/presentation/components/custom_text_button.dart';
import 'package:netflix_app/login/presentation/components/custom_text_form_field.dart';
import 'package:netflix_app/login/presentation/utils/app_colors.dart';

import '../components/login_controller.dart';

class LoginView extends StatefulWidget {
  final LoginController controller;
  const LoginView({super.key, required this.controller});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/logo.png',
          height: 31,
          width: 117,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextFormField(
                hintText: 'E-mail ou telefone',
                onChanged: widget.controller.addEmail,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'Senha',
                isPassword: true,
                onChanged: widget.controller.addPassword,
              ),
              const SizedBox(height: 16),
              StreamBuilder(
                stream: widget.controller.formValidatedStream,
                builder: (context, snapshot) {
                  final isValid = snapshot.data;
                  return InkWell(
                    key: const Key('login-button'),
                    onTap: _navigateToDashboard,
                    child: const CustomTextButton(text: 'ENTRAR'),
                  );
                },
              ),
              const SizedBox(height: 38),
              GestureDetector(
                  onTap: _navigateToRecoverPassword,
                  child: const Text('Recuperar a senha', style: TextStyle(color: AppColors.textGreySecondary))),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToDashboard() => Modular.to.navigate('/dashboard');
  void _navigateToRecoverPassword() => Modular.to.pushNamed('/recovery');
}
