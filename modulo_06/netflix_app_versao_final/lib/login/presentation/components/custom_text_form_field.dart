import 'package:flutter/material.dart';
import 'package:netflix_app/login/presentation/utils/app_colors.dart';

class CustomTextFormField extends StatefulWidget {
  final Function(String)? onChanged;
  final String hintText;
  final bool isPassword;
  const CustomTextFormField({super.key, required this.hintText, this.onChanged, this.isPassword = false});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  static const _defaultTextStyle = TextStyle(color: AppColors.textGreySecondary);
  late bool _obscurePassword = widget.isPassword;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Container(
          color: AppColors.graySecondary,
          child: TextFormField(
            onChanged: widget.onChanged,
            obscureText: _obscurePassword,
            style: _defaultTextStyle,
            cursorColor: AppColors.textGreySecondary,
            decoration: InputDecoration(
              hintText: widget.hintText,
              labelStyle: _defaultTextStyle,
              hintStyle: _defaultTextStyle,
              
              focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
            ),
          ),
        ),
        Visibility(
          visible: widget.isPassword,
          child: TextButton(
              onPressed: _togglePassword,
              child: const Text(
                'SHOW',
                style: TextStyle(color: AppColors.textGreySecondary),
              )),
        )
      ],
    );
  }

  void _togglePassword() => setState(() => _obscurePassword = !_obscurePassword);
}
