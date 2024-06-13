import 'dart:convert';
import 'package:app_six/data/categories.dart';
import 'package:app_six/models/grocery_item.dart';
import 'package:app_six/screens/new_item.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Groceries extends StatefulWidget {
  const Groceries({super.key});

  @override
  State<Groceries> createState() => _GroceriesState();
}

class _GroceriesState extends State<Groceries> {
  bool _isLoading = true;
  String? _error;
  List<GroceryItem> _list = [];
  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  void _loadItems() async {
    final url = Uri.https(
        'flutter-prep-1a354-default-rtdb.firebaseio.com', 'shopping-list.json');
    try {
      final response = await http.get(url);
      if (response.statusCode >= 400) {
        setState(() {
          _error = 'Failed to fetch data.';
        });
      }
      if (response.body == 'null') {
        setState(() {
          _isLoading = false;
        });
        return;
      }
      final List<GroceryItem> loadedItems = [];
      final Map<String, dynamic> listData = json.decode(response.body);
      for (final items in listData.entries) {
        final category = categories.entries
            .firstWhere(
              (element) => element.value.title == items.value['category'],
            )
            .value;
        loadedItems.add(GroceryItem(
            id: items.key,
            name: items.value['name'],
            quantity: items.value['quantity'],
            category: category));
      }
      setState(() {
        _list = loadedItems;
        _isLoading = false;
      });
    } catch (error) {
      setState(() {
        _error = 'Something went wrong. Try again later.';
      });
    }
  }

  void _addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (ctx) => NewItem(),
      ),
    );
    if (newItem == null) {
      return;
    } else {
      setState(() {
        _list.add(newItem);
      });
    }
  }

  void _removeItem(GroceryItem item) async {
    final index = _list.indexOf(item);
    setState(() {
      _list.remove(item);
    });
    final url = Uri.https('flutter-prep-1a354-default-rtdb.firebaseio.com',
        'shopping-list/${item.id}.json');
    final response = await http.delete(url);

    if (response.statusCode >= 400) {
      setState(() {
        _list.insert(index, item);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: CircularProgressIndicator(),
    );

    if (_error != null) {
      content = Center(
        child: Text(_error!),
      );
    }
    if (!_isLoading) {
      content = _list.isEmpty
          ? const Center(
              child: Text(
                'No Groceries added.',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Dismissible(
                  key: ValueKey(_list[index].id),
                  onDismissed: (value) {
                    _removeItem(_list[index]);
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.square,
                      color: _list[index].category.color,
                    ),
                    title: Text(
                      _list[index].name,
                    ),
                    trailing: Text(
                      _list[index].quantity.toString(),
                    ),
                  ),
                );
              },
              itemCount: _list.length,
            );
    }
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: _addItem, icon: const Icon(Icons.add))],
        title: const Text('Your Groceries'),
        //backgroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: content,
    );
  }
}
