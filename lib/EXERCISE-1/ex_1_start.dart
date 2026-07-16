import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

List<String> colors = ["red", "blue", "green"];

List<String> numbers = ["MON", "TUE", "WED", "THU"];
List<Widget> getLabels() {
  return numbers.map((item) => Text(item)).toList();
}


void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              Label("Method 1: Loop in Array", bold: true),
              // TODO
              Column(
                children: [
                  Text('Start'),
                  for (var i = 0; i < 10; i++) Text('Item $i'),
                  Text('End'),
                ],
              ),
              Label("Method 2: Map", bold: true),
              // TODO
              Text("Start"),
              ...colors.map((item) => Text(item)),
              Text("End"),

              Label("Method 3: Dedicated Function", bold: true),

              // TODO
              Column(children: [Text("Start"), ...getLabels(), Text("End")]),
            ],
          ),
        ),
      ),
    ),
  );
}

class Label extends StatelessWidget {
  const Label(this.text, {super.key, this.bold = false});

  final bool bold;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: (bold ? FontWeight.bold : FontWeight.normal),
      ),
    );
  }
}
