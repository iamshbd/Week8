import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List TodoList = [
    ['Ronan the best', false],
    ['Learn everything', false],
    ['Pass final exam', false],
    ['Get certification']
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learn Everything:D'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),

      body: ListView.builder(
        itemCount: TodoList.length,
        itemBuilder: (BuildContext context, index) {
          return Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20
            ),
            child: Container(
                padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(255, 221, 212, 158),
                
              ),
              child: Text(TodoList[index][0],
              style: TextStyle(
                fontSize: 20
              ),
              
              
              )),
              
          );
        },
      ),
    );
  }
}
