import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: selectedButton(),
    ),
  );
}

class User {
  final String name;
  final bool selected;

  User({required this.name, required this.selected});
}

class userData {
  static const String nameKey = "name";
  static const String selectedKey = "selected";
  static User fromJson(Map<String, dynamic> json) {
    if (json[nameKey] is! String || json[selectedKey] is! bool) {
      throw Exception("Invalid data");
    }
    return User(name: json[nameKey], selected: json[selectedKey]);
  }
}

class Repo {
  static final Repo instance = Repo();

  Future<User> getData() async {
     try {
      final url = Uri.parse(
        "https://honeypot-c1a49-default-rtdb.asia-southeast1.firebasedatabase.app/users.json",
      );
      final response = await http.get(url);
      if (response.statusCode != 200) {
        throw Exception("Failed : ${response.statusCode}");
      }
      final Map<String, dynamic> data = jsonDecode(response.body);
      return userData.fromJson(data);
    } catch (e) {
      throw Exception("Connection Error : $e");
    }
  }

  Future<void> updateSelected(bool selected) async {
    final url = Uri.parse(
      "https://honeypot-c1a49-default-rtdb.asia-southeast1.firebasedatabase.app/users.json",
    );

    final response = await http.patch(
      url,
      body: jsonEncode({"selected": selected}),
    );

    if (response.statusCode != 200) {
      throw Exception("Failed to update: ${response.statusCode}");
    }
  }
}

enum AsyncState { loading, success, error }

class selectedButton extends StatefulWidget {
  const selectedButton({super.key});
  @override
  State<selectedButton> createState() => selectedButtonState();
}

class selectedButtonState extends State<selectedButton> {
  AsyncState state = AsyncState.loading;
  User? user;
  bool isSelect = false;

  @override
  void initState() {
    super.initState();
    fetchButton();
  }

  Future<void> fetchButton() async {
    setState(() {
      state = AsyncState.loading;
    });

    try {
      user = await Repo.instance.getData();
      isSelect = user!.selected;
      setState(() {
        state = AsyncState.success;
      });
    } catch (e) {
      print(e);
      setState(() {
        state = AsyncState.error;
      });
    }
  }

  void onPress() async {
    final newValue = !isSelect;
    setState(() {
      isSelect = newValue;
    });

    try {
      await Repo.instance.updateSelected(newValue);
    } catch (e) {
      setState(() {
        isSelect = !newValue;
      });
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget body;

    switch (state) {
      case AsyncState.loading:
        body = const Center(child: CircularProgressIndicator());
        break;
      case AsyncState.error:
        body = const Center(child: Text("Error fetching data"));
        break;
      case AsyncState.success:
        body = Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: isSelect ? Colors.blue : Colors.grey,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            ),
            onPressed: onPress,
            child: Text(user!.name, style: const TextStyle(fontSize: 20)),
          ),
        );
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Exercise 1")),
      body: body,
    );
  }
}
