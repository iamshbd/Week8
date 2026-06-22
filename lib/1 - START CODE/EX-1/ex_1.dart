import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text("Custom buttons")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyButton(),
            SizedBox(height: 20),
            MyButton(),
            SizedBox(height: 20),
            MyButton(),
          ],
        ),
      ),
    ),
  ),
);

class MyButton extends StatefulWidget {
  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  bool isSelected = false;

  String get buttonText {
    if (isSelected) {

      return "Selected";
    } else {
      return "Not Selected";
    }
  }

  Color get textColor {
    if (isSelected) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  Color get backgroundColor {
    
    if (isSelected) {
      return Colors.blue[500]!;
    } else {
      return Colors.blue[50]!;

    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            isSelected = !isSelected;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
        ),
        child: Center(child: Text(buttonText)),
      ),
    );
  }
}


