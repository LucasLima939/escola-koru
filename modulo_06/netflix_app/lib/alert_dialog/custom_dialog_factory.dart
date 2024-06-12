import 'package:flutter/widgets.dart';
import 'package:netflix_app/alert_dialog/android_dialog.dart';
import 'package:netflix_app/alert_dialog/custom_dialog.dart';
import 'package:netflix_app/alert_dialog/ios_dialog.dart';

class CustomDialogFactory {
  final Key key;
  final Widget title;
  final Widget content;
  final List<Widget> actions;
  CustomDialogFactory({
    required this.key,
    required this.title,
    required this.content,
    required this.actions,
  });

  Widget buildDialog({bool isAndroid = true}) {
    if (isAndroid) {
      return AndroidDialog(
          key: key, actions: actions, content: content, title: title).buildDialog();
    } else {
      return IosDialog(
          key: key, actions: actions, content: content, title: title).buildDialog();
    }
  }
}
