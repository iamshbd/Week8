// import 'dart:convert' as convert;

// import 'package:http/http.dart' as http;
// import 'package:http/http.dart';

// class buttonData {
//   final String name;
//   final double id;

//   buttonData({required this.name, required this.id});

//   static buttonData fromJson(Map<String, dynamic> json) {
    
//   }
// }

// void main() async {
//   Uri url = Uri.parse(
//     'https://honeypot-c1a49-default-rtdb.asia-southeast1.firebasedatabase.app/users.json',
//   );

// }



import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SelectedButton(),
    ),
  );
}

class User {
  final String title;
  final bool selection;

  User({required this.title, required this.selection});
}

class UserData {
  static const String titleKey = "title";
  static const String selectionKey = "selection";

  static User fromJson(Map<String, dynamic> json) {
    if (json[titleKey] is! String || json[selectionKey] is! bool) {
      throw Exception("Invalid Firebase data");
    }

    return User(title: json[titleKey], selection: json[selectionKey]);
  }
}

class Repo {
  static final Repo instance = Repo();

  Future<User> getData() async {
    try {
      final url = Uri.parse(
        "https://ronan-10a3d-default-rtdb.asia-southeast1.firebasedatabase.app//buttonStatus.json",
      );

      final response = await http.get(url);

      if (response.statusCode != 200) {
        throw Exception("Failed : ${response.statusCode}");
      }

      final Map<String, dynamic> data = jsonDecode(response.body);

      return UserData.fromJson(data);
    } catch (e) {
      throw Exception("Connection Error : $e");
    }
  }
}

enum AsyncState { loading, success, error }

class SelectedButton extends StatefulWidget {
  const SelectedButton({super.key});

  @override
  State<SelectedButton> createState() => SelectedButtonState();
}

class SelectedButtonState extends State<SelectedButton> {
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

      isSelect = user!.selection;

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

  void onPress() {
    setState(() {
      isSelect = !isSelect;
    });
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

            child: Text(user!.title, style: const TextStyle(fontSize: 20)),
          ),
        );
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Exercise 1")),

      body: body,
    );
  }
}
