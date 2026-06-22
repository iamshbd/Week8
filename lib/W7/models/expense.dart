// import 'package:uuid/uuid.dart';

// const uuid = Uuid();

// enum Category { food, travel, leisure, work}

// class Expense {
//   Expense({
//     required this.title,
//     required this.amount,
//     required this.date,
//     required this.category,
//   }) : id = uuid.v4();

//   final String id;
//   final String title;
//   final double amount;
//   final DateTime date;
//   final Category category;
// }
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category {
  food,
  travel,
  leisure,
  work;

  // ✅ Add this
  IconData get icon {
    switch (this) {
      case Category.food:
        return Icons.lunch_dining;
      case Category.travel:
        return Icons.flight_takeoff;
      case Category.leisure:
        return Icons.movie;
      case Category.work:
        return Icons.work;
    }
  }
}

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
}
