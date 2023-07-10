import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'send.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  List<String> names = [];
  List<String> dateTimes = [];

  void _saveData(BuildContext context) async {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('h:mm a - MM/dd/yyyy').format(now);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', _nameController.text);
    await prefs.setString('dateTime', formattedDate);

    names.add(_nameController.text);
    dateTimes.add(formattedDate);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SendPage(names, dateTimes)),
    );

    _nameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Shared Preferences Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Enter your name:',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _saveData(context);
              },
              child: Text('Send'),
            ),
          ],
        ),
      ),
    );
  }
}
