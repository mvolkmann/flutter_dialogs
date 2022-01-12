import 'package:flutter/cupertino.dart';
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

  void _alert(String message, {bool cupertino = false}) {
    alert(
      context: context,
      cupertino: cupertino,
      title: 'Alert',
      message: message,
    );
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
      helpText: 'Select a date.',
      initialDate: selectedDateTime,
      firstDate: DateTime(1970),
      lastDate: DateTime(2030, 12, 31),
    );
    if (dateTime != null) {
      setState(() => selectedDateTime = dateTime);
    }
  }

  void _pickDateRange(BuildContext context) async {
    var dateRange =
        DateTimeRange(start: DateTime(2022, 4, 16), end: DateTime(2022, 5, 3));
    // Click the start date, then click the end date.
    // Click again to start over, selecting a new start date.
    // The days in between will be shaded
    // to indicate that they are in the range.
    var newDateRange = await showDateRangePicker(
      context: context,
      helpText: 'Select start and end dates.',
      initialDateRange: dateRange,
      firstDate: DateTime(1970),
      lastDate: DateTime(2030, 12, 31),
    );
    print('newDateRange = $newDateRange');
  }

  void _pickTime(BuildContext context) async {
    var time = TimeOfDay(hour: 10, minute: 19);
    var newTime = await showDialog(
      context: context,
      builder: (_) => TimePickerDialog(
        helpText: 'Select a time.',
        initialTime: time,
      ),
    );
    print('newTime = $newTime');
  }

  void _showAbout(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AboutDialog(
              applicationIcon: Icon(Icons.ac_unit_outlined),
              applicationName: 'Dialog Demos',
              applicationVersion: '1.0.0',
              applicationLegalese: 'All rights reserved.',
            ));
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
              child: Text('About...'),
              onPressed: () => _showAbout(context),
            ),
            ElevatedButton(
              child: Text('Show Material Alert Dialog'),
              onPressed: () => _alert('Something interesting happened.'),
            ),
            ElevatedButton(
              child: Text('Show Cupertino Alert Dialog'),
              onPressed: () => _alert(
                'Something interesting happened.',
                cupertino: true,
              ),
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
            ElevatedButton(
              child: Text('Select Date Range'),
              onPressed: () => _pickDateRange(context),
            ),
            ElevatedButton(
              child: Text('Select Time'),
              onPressed: () => _pickTime(context),
            )
          ],
        ),
      ),
    );
  }
}
