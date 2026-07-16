import 'dart:convert' as convert;

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class UserDto {
  static final name = "name";
  static final score = "score";

  static User fromJson(Map<String, dynamic> json) {
    assert(json[name] is String);
    assert(json[score] is int);

    String nameValue = json[name];
    int scoreValue = json[score];

    return User(name: nameValue, score: scoreValue);
  }
}

class User {
  final String name;
  final int score;

  User({required this.name, required this.score});

  @override
  String toString() {
    return "User: name: $name - score= $score";
  }
}

void main() async {
  Uri url = Uri.parse(
    "https://g1-g2-4088d-default-rtdb.asia-southeast1.firebasedatabase.app/users/user01.json",
  );

  try {
    Response response = await http.get(url);
    if (response.statusCode != 200) {
      // Error handling
      throw Exception('Failed to fetch products (HTTP ${response.statusCode})');
    }

    String body = response.body; // This is a string
    Map<String, dynamic> json = convert.jsonDecode(
      response.body,
    ); // This is a map
    User user = UserDto.fromJson(json); // This is a user object

    print(user);
  } on Exception catch (e) {
    print(e);
  }
}
