import 'package:flutter/material.dart';
import 'my_alert_dialog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dialog Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime selectedDateTime = DateTime.now();

  void _alert(String message) {
    alert(context: context, title: 'Alert', message: message);
  }

  void _confirm(String question) async {
    var answer = await confirm(
      context: context,
      title: 'Confirm',
      message: question,
    );
    print('answer = $answer');
  }

  void _pickDate() async {
    var dateTime = await showDatePicker(
      context: context,
      initialDate: selectedDateTime,
      //
      firstDate: DateTime(1970),
      lastDate: DateTime(2030, 12, 31),
    );
    if (dateTime != null) {
      setState(() => selectedDateTime = dateTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    print(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('Show Alert Dialog'),
              onPressed: () => _alert('Something interesting happened.'),
            ),
            ElevatedButton(
              child: Text('Show Confirm Dialog'),
              onPressed: () => _confirm('Are you sure?'),
            ),
            Text(selectedDateTime.toString()),
            ElevatedButton(
              child: Text('Show DatePickerDialog'),
              onPressed: _pickDate,
            ),
          ],
        ),
      ),
    );
  }
}
