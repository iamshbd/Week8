import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(

        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [

            Color(0xFF1A1A2E),
            Color(0xFF16213E),

            Color(0xFF0F3460),


            Color(0xFF533483),
          ],
        ),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ItemBox(color: Colors.red, label: 'Red'),
          SizedBox(height: 12),

          ItemBox(color: Colors.green, label: 'Green'),
          SizedBox(height: 12),
          ItemBox(color: Colors.orange, label: 'Orange'),
          SizedBox(height: 12),
          ItemBox(color: Colors.purple, label: 'Purple'),
        ],
      ),
    ),
  ));
}

class ItemBox extends StatelessWidget {
  final Color color;

  final String label;

  const ItemBox({
    super.key,
    required this.color,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,

      
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(

            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
