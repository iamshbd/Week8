import 'package:flutter/material.dart';

import '../../models/expense.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key});

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  Category _selectedCategory = Category.food;
  String? _amountError;

  // Option 1: Validate on every keystroke (via controller listener)
  // I chose TextEditingController over state management because:
  // - Controllers are purpose-built for form field text management
  // - They don't cause unnecessary rebuilds on every keystroke
  // - The error state is a separate concern managed via setState

  @override
  void initState() {
    super.initState();
    _amountController.addListener(_validateAmount);
  }

  void _validateAmount() {
    final text = _amountController.text;
    setState(() {
      if (text.isEmpty) {
        _amountError = null;
        return;
      }
      final parsed = double.tryParse(text);
      if (parsed == null) {
        _amountError = 'Please enter a valid number';
      } else if (parsed < 0 || parsed > 100) {
        _amountError = 'Amount must be between 0 and 100';
      } else {
        _amountError = null;
      }
    });
  }

  bool get _canSave =>
      _titleController.text.isNotEmpty &&
      _amountController.text.isNotEmpty &&
      _amountError == null;

  void onCheckPressed() {
    if (!_canSave) return;

    final amount = double.parse(_amountController.text);

    Expense newExpense = Expense(
      amount: amount,
      title: _titleController.text,
      category: _selectedCategory,
      date: DateTime.now(),
    );

    Navigator.pop<Expense>(context, newExpense);
  }

  void onCancelPressed() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Expense')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _titleController,
              maxLength: 50,
              decoration: const InputDecoration(label: Text('Title')),
              onChanged: (_) => setState(() {}),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              maxLength: 50,
              decoration: InputDecoration(
                prefix: const Text('\$'),
                label: const Text('Amount'),
                errorText: _amountError,
                errorStyle: const TextStyle(color: Colors.red),
              ),
            ),

            const SizedBox(height: 16),

            DropdownButtonFormField<Category>(
              initialValue: _selectedCategory,
              items: Category.values
                  .map((c) => DropdownMenuItem(
                        value: c,
                        child: Row(
                          children: [
                            Icon(c.icon, size: 20),
                            const SizedBox(width: 8),
                            Text(c.name),
                          ],
                        ),
                      ))
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() => _selectedCategory = value);
                }
              },
              decoration: const InputDecoration(label: Text('Category')),
            ),

            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: onCancelPressed,
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: _canSave ? onCheckPressed : null,
                  child: const Text('Save'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
