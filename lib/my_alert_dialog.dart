import 'package:flutter/material.dart';

/// Displays an AlertDialog with Cancel and OK buttons
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
      content: message,
    ),
  );
}

class MyAlertDialog extends StatelessWidget {
  final String title;
  final String content;

  MyAlertDialog({Key? key, required this.title, required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: Text('OK'),
        ),
      ],
    );
  }
}
