import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Displays an AlertDialog with an OK button
/// which just closes the dialog.  No value is returned.
Future<void> alert({
  required BuildContext context,
  required String title,
  required String message,
  bool cupertino = false,
}) async {
  await showDialog<String>(
    context: context,
    builder: (_) => MyAlertDialog(
      cupertino: cupertino,
      title: title,
      message: message,
      options: ['OK'],
    ),
  );
}

/// Displays an AlertDialog with No and Yes buttons
/// and returns a Future that succeeds with a String
/// that is the text on the pressed button.
Future<String?> confirm({
  required BuildContext context,
  required String title,
  required String message,
  bool cupertino = false,
}) async {
  return await showDialog<String>(
    context: context,
    builder: (_) => MyAlertDialog(
      title: title,
      message: message,
      options: ['No', 'Yes'],
    ),
  );
}

class MyAlertDialog extends StatelessWidget {
  final bool cupertino;
  final String title;
  final String message;
  final List<String> options;

  MyAlertDialog({
    Key? key,
    this.cupertino = false,
    required this.title,
    required this.message,
    required this.options,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var buttons = options
        .map(
          (option) => TextButton(
            onPressed: () => Navigator.pop(context, option),
            child: Text(option),
          ),
        )
        .toList();

    // "Tearoffs" for constructor calls is coming soon.
    // See https://github.com/dart-lang/language/blob/master/accepted/2.15/constructor-tearoffs/feature-specification.md.
    /*
    var ctor = cupertino ? CupertinoAlertDialog : AlertDialog;
    return ctor(
      title: Text(title),
      content: Text(message),
      actions: buttons,
    );
    */

    // We have to use this approach until constructor tearoffs are supported.
    return cupertino
        ? CupertinoAlertDialog(
            title: Text(title),
            content: Text(message),
            actions: buttons,
          )
        : AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: buttons,
          );
    */
  }
}
