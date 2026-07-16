import 'package:flutter/material.dart';

class OrangeCard extends StatelessWidget {
  const OrangeCard({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    
    
    ("Build the item $index");

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
        appBar: AppBar(title: Text("Big list -  with Column + Scroll View")),
        body:  SingleChildScrollView(
          child: Column(
            children: [
               for(int i=0; i<2000; i++) OrangeCard(index: i)
            ],
          ),
        ),
      ),
    ),
  );
}
