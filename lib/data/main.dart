import 'package:flutter/material.dart';

import '../ui/screens/expenses/expenses_screen.dart';
import '../../../models/expense.dart'; 
class ExpenseCard extends StatelessWidget {
  final Expense expense;
  const ExpenseCard({super.key, required this.expense});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: FlutterLogo(size: 56.0),

      title: Text('Two-line ListTile'),
      subtitle: Text('Here is a second line'),
      trailing: Icon(Icons.more_vert),
    );
  }
}

void main() {
  runApp(MaterialApp(home: ExpensesScreen()));
}























// lib/ui/screens/expenses/expense_card.dart
// import 'package:flutter/material.dart';
// import '../../../models/expense.dart';

// class ExpenseCard extends StatelessWidget {
//   final Expense expense;

//   const ExpenseCard({super.key, required this.expense});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: ListTile(
//         leading: const Icon(Icons.attach_money, size: 40),
//         title: Text(expense.title),
//         subtitle: Text('\$${expense.amount.toStringAsFixed(2)}'),
//         trailing: const Icon(Icons.more_vert),
//       ),
//     );
//   }
// }