import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Container(
      margin: const EdgeInsets.all(30),
      color: Colors.blue,
      child: Container(
        margin: const EdgeInsets.all(20),
        
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),

          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              offset: Offset(2, 4),
            ),
          ],
        ),
        child: const Center(
          child: Text(
            'Hello, Container!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    ),
  ));
}
