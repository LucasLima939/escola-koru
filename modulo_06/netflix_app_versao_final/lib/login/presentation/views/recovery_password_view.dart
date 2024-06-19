import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:netflix_app/login/presentation/components/custom_text_button.dart';
import 'package:netflix_app/login/presentation/components/custom_text_form_field.dart';
import 'package:netflix_app/login/presentation/utils/app_colors.dart';

class RecoveryPasswordView extends StatelessWidget {
  const RecoveryPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Modular.to.pop(),
          child: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.textGreySecondary,
          ),
        ),
        title: Image.asset(
          'assets/logo.png',
          height: 31,
          width: 117,
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextFormField(
                hintText: 'E-mail ou telefone',
                isPassword: true,
              ),
              SizedBox(height: 16),
              CustomTextButton(text: 'ENVIAR')
            ],
          ),
        ),
      ),
    );
  }
}
