import 'package:flutter/material.dart';

abstract class CustomDialog {
  final Key key;
  final Widget title;
  final Widget content;
  final List<Widget> actions;
  CustomDialog({
    required this.key,
    required this.title,
    required this.content,
    required this.actions,
  });

  Widget buildDialog();
}
