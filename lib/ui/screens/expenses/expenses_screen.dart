import 'package:flutter/material.dart';

import '../../../data/expenses_data.dart';

class ExpensesScreen extends StatelessWidget {
  const ExpensesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> tiles = allExpenses.map((e) => Text(e.title)).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Expenses App G1-G2"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: tiles),
      ),
    );
  }
}
