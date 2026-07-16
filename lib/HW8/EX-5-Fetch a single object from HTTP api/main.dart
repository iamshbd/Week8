import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

void main() async {
  // Uri url = Uri.parse('https://fooapi.com/api/products');
  Uri url = Uri.parse('https://jsonplaceholder.typicode.com/users/1');

  // 1- Get the request response
  Response response = await http.get(url);

  // 2- Check the responsae status
  if (response.statusCode != 200) {
    throw Exception('Failed to fetch user (HTTP ${response.statusCode})');
  }

  // 3- Parse the response
  Map<String, dynamic> json = jsonDecode(response.body);

 
  List<dynamic> jsonItems = json["data"];
  Map<String, dynamic> jsonItem = jsonItems[0];

  User user = User.fromJson(jsonItem);
  print(user);
}

class User {
  final String name;
  final double id;

  User({required this.name, required this.id});

  static User fromJson(Map<String, dynamic> json) {
    const String titleKey = 'id';
    const String priceKey = 'name';

    assert(json[titleKey] is String);
    assert(json[priceKey] is double);

    String title = json[titleKey];
    double price = json[priceKey];

    return User(name: title, id: price);
  }

  @override
  String toString() {
    return "USER $name - ID= $id";
  }
}
