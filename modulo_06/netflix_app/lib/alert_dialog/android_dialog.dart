import 'package:flutter/material.dart';
import 'package:netflix_app/alert_dialog/custom_dialog.dart';

class AndroidDialog extends CustomDialog {
  AndroidDialog(
      {required super.key,
      required super.title,
      required super.content,
      required super.actions});

  @override
  Widget buildDialog() => AlertDialog(
    key: key,
    title: title,
    content: content,
    actions: actions,
  );
}
