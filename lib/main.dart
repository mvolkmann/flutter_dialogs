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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  void _alert({
    required BuildContext context,
    bool cupertino = false,
    required String message,
  }) {
    alert(
      context: context,
      cupertino: cupertino,
      title: 'Alert',
      message: message,
    );
  }

  void _confirm({
    required BuildContext context,
    required String question,
  }) async {
    var answer = await confirm(
      context: context,
      title: 'Confirm',
      message: question,
    );
    print('answer = $answer');
  }

  void _pickDate({required BuildContext context}) async {
    var dateTime = DateTime.now();
    var newDateTime = await showDatePicker(
      context: context,
      helpText: 'Select a date.',
      initialDate: dateTime,
      firstDate: DateTime(1970),
      lastDate: DateTime(2030, 12, 31),
    );
    print('newDateTime = $newDateTime');
  }

  void _pickDateRange({required BuildContext context}) async {
    var dateRange = DateTimeRange(
      start: DateTime(2022, 4, 16),
      end: DateTime(2022, 5, 3),
    );
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
        title: Text('Dialog Demo'),
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
              onPressed: () => _alert(
                context: context,
                message: 'Something interesting happened.',
              ),
            ),
            ElevatedButton(
              child: Text('Show Cupertino Alert Dialog'),
              onPressed: () => _alert(
                context: context,
                cupertino: true,
                message: 'Something interesting happened.',
              ),
            ),
            ElevatedButton(
              child: Text('Show Confirm Dialog'),
              onPressed: () => _confirm(
                context: context,
                question: 'Are you sure?',
              ),
            ),
            ElevatedButton(
              child: Text('Show DatePickerDialog'),
              onPressed: () {
                _pickDate(context: context);
              },
            ),
            ElevatedButton(
              child: Text('Select Date Range'),
              onPressed: () => _pickDateRange(context: context),
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
