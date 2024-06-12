import 'package:flutter/cupertino.dart';
import 'package:netflix_app/alert_dialog/custom_dialog.dart';

class IosDialog extends CustomDialog {
  IosDialog(
      {required super.key,
      required super.title,
      required super.content,
      required super.actions});

  @override
  Widget buildDialog() => CupertinoAlertDialog(
    key: key,
    title: title,
    content: content,
    actions: actions,
  );
}
