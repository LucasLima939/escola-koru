import 'package:flutter/material.dart';
import 'package:netflix_app/login/presentation/utils/app_colors.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  const CustomTextButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 400,
        height: 64,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: AppColors.graySecondary),
        ),
        child: Center(child: Text(text, style: const TextStyle(color: AppColors.textGreySecondary))));
  }
}
