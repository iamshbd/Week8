import 'package:flutter/material.dart';
import '../../../data/mock_grocery_data.dart';
import '../../../models/grocery.dart';
import 'grocery_form.dart';
import 'grocery_tile.dart';

class GroceryScreen extends StatefulWidget {
  const GroceryScreen({super.key});

  @override
  State<GroceryScreen> createState() => _GroceryScreenState();
}


class _GroceryScreenState extends State<GroceryScreen> {
  final List<GroceryItem> _items = List.from(allGroceryItems);

  void onCreate() 
  async {
    final newItem = await showModalBottomSheet<GroceryItem>(
      context: context,
      builder: (_) => const GroceryForm(),
    );

    if (newItem != null) {
      setState(() => _items.add(newItem));
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No items added yet.'));

    if (_items.isNotEmpty) {
      content = ListView.builder(
        itemCount: _items.length,
        itemBuilder: (_, i) => GroceryTile(item: _items[i]),
      );

    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(onPressed: onCreate, icon: const Icon(Icons.add)),
        ],
      ),
      body: content,
    );
  }
}
