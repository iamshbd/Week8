import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

enum UserRole { student, teacher, admin }

class User {
  final String name;
  final UserRole role;

  User({required this.name, required this.role});

  static User fromJSon(Map<String, dynamic> json) {
    String nameFound = json['username'];

    UserRole? roleFound;
    for (UserRole r in UserRole.values) {
      if (r.name == json['role']) {
        roleFound = r;
      }
    }

    if (roleFound == null) {
      throw Exception(" Role is not correct:  $json['role']");
    }

    return User(name: nameFound, role: roleFound);
  }

  @override
  String toString() {
    return "user name = $name - role = ${role.name}";
  }
}

class AuthSession {
  final User user;
  final String token;

  AuthSession({required this.user, required this.token});
}

void main() async {
  Uri loginUri = Uri.parse("http://localhost:3000/login");

  Map<String, dynamic> body = {"username": "ronan", "password": "thebest"};

  Response response = await http.post(
    loginUri,
    headers: {"Content-Type": "application/json"},
    body: jsonEncode(body),
  );

  Map<String, dynamic> json = jsonDecode(response.body);

  if (response.statusCode == 200) {
    // 1 -  Get the token
    String token = json["token"];

    // 2- Decode the token using JwtDecoder
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);

    // 3- Create the user
    User user = User.fromJSon(decodedToken);

    // 4- Creat the auth session
    AuthSession session = AuthSession(user: user, token: token);

    print(session.user);
  } else {
    //   Get the error
    String error = json["error"];
    print("Error : \n $error");
  }
}
