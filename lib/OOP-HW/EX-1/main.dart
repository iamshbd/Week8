import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        appBar: null,
        body: Center(
          child: Text(
            'Welcome to Flutter!',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
              letterSpacing: 1.5,
            ),
          ),
        ),
      ),
    ),
  );
}
