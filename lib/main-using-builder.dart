import 'package:flutter/material.dart';

class OrangeCard extends StatelessWidget {
  const OrangeCard({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    print("Build the item $index");

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        color: Colors.amber,
        height: 200,
        child: Center(child: Text("$index")),
      ),
    );
  }
}

void main() {
  
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Big list - with  List View + Item Builder")),
        body: ListView.builder(itemCount: 300, itemBuilder:  (context, index) => OrangeCard(index: index),),
      ),
    ),
  );
}
