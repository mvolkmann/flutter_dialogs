import 'package:flutter/material.dart';

/// Displays an AlertDialog with an OK button
/// which just closes the dialog.  No value is returned.
Future<void> alert({
  required BuildContext context,
  required String title,
  required String message,
}) async {
  await showDialog<String>(
    context: context,
    builder: (_) => MyAlertDialog(
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
  final String title;
  final String message;
  final List<String> options;

  MyAlertDialog({
    Key? key,
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
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: buttons,
    );
  }
}
