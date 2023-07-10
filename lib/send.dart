import 'package:flutter/material.dart';

class SendPage extends StatelessWidget {
  final List<String> names;
  final List<String> dateTimes;

  SendPage(this.names, this.dateTimes);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Received'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: names.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name: ${names[index]}',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Date & Time: ${dateTimes[index]}',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 16),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
