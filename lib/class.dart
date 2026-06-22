import 'package:flutter/material.dart';

// void main() {
//   runApp(
//     MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: Center(
//           child: Text(
//             'Hello my name is Bondeth!!',
//             style: TextStyle(fontSize: 50, color: Colors.orange),
//           ),
//         ),
//       ),
//     ),
//   );
// }

// void main() {
//   runApp(
//     MaterialApp(
//       home: Container(
//         color: Colors.blue[300],
//         margin: EdgeInsets.all(18),
//         padding: EdgeInsets.all(14),
//         child: Container(
//           decoration: BoxDecoration(
//             color: Colors.blue[600],
//             borderRadius: BorderRadius.circular(20),
//           ),
//           margin: EdgeInsets.all(10),
//           child: Center(child: Text('CADT STUDENT',
//           style: TextStyle(fontSize: 50, color: Colors.white),)),
//         ),
//       ),
//     ),
//   );
// }

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        color: const Color.fromARGB(255, 226, 230, 222),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                color: const Color.fromARGB(255, 151, 227, 233),
                child: Center(
                  child: Text("OOP", style: TextStyle(color: Colors.white)),
                ),
              ),

              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                color: const Color.fromARGB(255, 62, 193, 216),
                child: Center(
                  child: Text("DART", style: TextStyle(color: Colors.white)),
                ),
              ),

              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                color: const Color.fromARGB(255, 46, 108, 201),
                child: Center(
                  child: Text("FLUTTER", style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}











//layout


// void main() {
//   runApp(
//     MaterialApp(
//       home: Center(
//         child: Column(
//           children: [
//             Container(height: 100, color: Colors.white),

//             Container(height: 400, color: Colors.blue),

//             Row(
//               children: [
//                 Expanded(
//                   flex: 3,
//                   child: Container(height: 100, color: Colors.green),
//                 ),
//                 Expanded(
//                   flex: 1,
//                   child: Container(height: 100, color: Colors.pink[200]),
//                 ),
//               ],
//             ),
//             Row(
//               children: [
//                 Expanded(
//                   flex: 1,
//                   child: Container(height: 100, color: Colors.yellow),
//                 ),
//                 SizedBox(width: 20),

//                 Expanded(flex: 1,child: Container(height: 100, color: Colors.yellow)),
//                 SizedBox(width: 20),

//                 Expanded(flex: 1,child: Container(height: 100, color: Colors.yellow)),
                
//               ],
//             ),

//             Container(height: 20, color: Colors.white),

//             Expanded(child: Container(height: 0, color: Colors.pink[200])),
//           ],
//         ),
//       ),
//     ),
//   );
// }




//the hobbies
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(home: Scaffold(
//     appBar: AppBar(
//       title: Text('My Hobbies'),

//     ),
//     body: Padding(
//       padding: EdgeInsetsGeometry.all(40),
//       child: Column(
//         children: [


//           Container(
//             padding:EdgeInsets.all(100),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               color: Colors.green,
//             ),
//             child: Center(
//               child: Row(
//                 children: [
//                   SizedBox(width: 30),
//                   SizedBox(width: 20),
//                   Icon(Icons.travel_explore),
//                   Text('Travelling')
//                 ],
                
//               ),
              


//             ),
            
//           ),
//           SizedBox(height: 10),
//           Container(
//             padding: EdgeInsets.all(100),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               color: Colors.blueGrey,
//             ),
//             child: Center(
//               child: Row(
//                 children: [
//                   SizedBox(width: 30),
//                   SizedBox(width: 20),
//                   Icon(Icons.skateboarding),
//                   Text('Skating'),
//                 ],
//               )
//             )
//           )
//         ]
//       ),
//       ),



    
    
    
//   )));
// }





//thebutton
import 'package:flutter/material.dart';



void main() {
  runApp(MaterialApp(home: Scaffold(
    appBar: AppBar(
      title: Text('Custom Button'),

    ),
    body: Padding(
      padding: EdgeInsetsGeometry.all(40),
      child: Column(
        children: [
          


          Container(
            padding:EdgeInsets.all(100),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.blueAccent,
            ),
            child: Center(
              child: Row(
                children: [
                  SizedBox(width: 30),
                  SizedBox(width: 20),
                  Icon(Icons.check),
                  Text('Submit')
                ],
                
              ),
              


            ),
            
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(100),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.green,
            ),
            child: Center(
              child: Row(
                children: [
                  SizedBox(width: 30),
                  SizedBox(width: 20),
                  Icon(Icons.timer),
                  Text('Time'),
                ],
              )
            )
          ),
          SizedBox(height: 10),

          Container(
            padding: EdgeInsets.all(100),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey,
            ),
            child: Center(
              child: Row(
                children: [
                  SizedBox(width: 30),
                  SizedBox(width: 20),
                  Icon(Icons.account_balance),
                  Text('Account'),
                ],
              )
            )
          )
        ]
      ),
      ),



    
    
    
  )));
}




import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'My app',
      home: Counter(),
    ),
  );
}

class Counter extends StatefulWidget {
  const Counter({
    super.key,
  });

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int counter = 0;import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        backgroundColor: Colors.grey[300],
        body:
            // YOUR CODE
            Column(),
      ),
    ),
  );
}

  void onPress() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Counter widget - rebuilding...");

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Title("Great counter"),
        Label("Current value: $counter"),
        TextButton(
          onPressed: onPress,
          child: const Text("Increment"),
        )
      ],
    );
  }
}

class Label extends StatelessWidget {
  const Label(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    print("Label widget - rebuilding...");

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 30, color: Colors.grey, decoration: TextDecoration.none),
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    print("const Title widget - rebuilding...");

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 50, color: Colors.blue, decoration: TextDecoration.none),
      ),
    );
  }
}
