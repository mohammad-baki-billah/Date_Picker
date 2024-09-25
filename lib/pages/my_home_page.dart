import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Selected Date: ',
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
                onPressed: () async {
                  DateTime? datePicked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2022),
                    lastDate: DateTime(2025),
                  );
                  if (datePicked != null) {
                    print('Date Selected: ${datePicked.toString()}');
                  }
                },
                child: Text(
                  'Show',
                  style: TextStyle(color: Colors.black),
                )),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  TimeOfDay? pickerTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                      initialEntryMode: TimePickerEntryMode.dial);
                  if (pickerTime != null) {
                    print(
                        'Picked Time:${pickerTime.hour}:${pickerTime.minute}');
                  }
                },
                child: Text(
                  'Selected Time',
                  style: TextStyle(color: Colors.black),
                ))
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
