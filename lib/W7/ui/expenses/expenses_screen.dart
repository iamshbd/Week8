// 

import 'package:flutter/material.dart';

import '../../data/expenses_data.dart';
import '../../models/expense.dart';

class ExpenseCard extends StatelessWidget {
  const ExpenseCard({super.key, required this.expense});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          title: Text(expense.title),
          subtitle: Text(expense.amount.toString()),
          leading: Icon(expense.category.icon),
        ),
      ),
    );
  }
}

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key});

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  TextEditingController titleController = TextEditingController();

  void onCancel() {
    Navigator.pop(context);
  }

  void onSubmit() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(label: Text("Enter title")),
            ),

            SizedBox(height: 40),
            ElevatedButton(onPressed: onCancel, child: Text("CANCEL")),
            ElevatedButton(onPressed: onSubmit, child: Text("SUBMIT")),
          ],
        ),
      ),
    );
  }
}

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() {
    return _ExpensesScreenState();
  }
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  void onAddPressed(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      builder: (context) => ExpenseForm(),
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => onAddPressed(context),
            icon: Icon(Icons.add),
          ),
        ],
        backgroundColor: Colors.blue[700],
        title: const Text('Ronan-The-Best Expenses App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: allExpenses.length,
          itemBuilder: (context, i) => ExpenseCard(expense: allExpenses[i]),
        ),
      ),
    );
  }
}
