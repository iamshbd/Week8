import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

enum UserRole { student, teacher, admin }

class User {
  final String name;
  final UserRole role;

  User({required this.name, required this.role});

  static User fromJSon(Map<String, dynamic> json) {
    return User(
      name: json['username'],
      role: UserRole.values.firstWhere((r) => r.name == json['role']),
    );
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

class AuthService {
  static AuthService instance = AuthService(); // single instance

  AuthSession? session;

  bool get isLoggedIn => session != null;

  Future<void> login() async {
    final Uri baseUri = Uri.parse("http://localhost:3000");

    // 1- Login
    final Uri loginUrl = baseUri.replace(path: "login");
    Map<String, dynamic> body = {"username": "john", "password": "1234"};
    Response response = await http.post(
      loginUrl,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );

    Map<String, dynamic> json = jsonDecode(response.body);

    if (response.statusCode != 200) {
      String error = json["error"];
      throw Exception("Error : \n $error");
    }

    // 2- Get the token
    String token = json["token"];

    // 3- Decode token
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    User user = User.fromJSon(decodedToken);

    // 4 - Update the session
    session = AuthSession(user: user, token: token);
  }

  Future<void> logout() async {
    session = null; // nothing else needed for now
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void login() {
    // Ask the Authen service to login
    AuthService.instance.login();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: login, child: Text("LOGIN")),
      ),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  String get welcomeLabel => "Welcome";

  void logout() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(welcomeLabel),
        actions: [IconButton(onPressed: logout, icon: Icon(Icons.logout))],
      ),
      body: Center(child: Text("Welcome")),
    );
  }
}

class AppSCreen extends StatefulWidget {
  const AppSCreen({super.key});

  @override
  State<AppSCreen> createState() => _AppSCreenState();
}

class _AppSCreenState extends State<AppSCreen> {
  Widget get content {
    bool isLogged = AuthService.instance.isLoggedIn;
    if (isLogged) {
      return WelcomeScreen();
    }
    return LoginScreen();
  }

  @override
  Widget build(BuildContext context) {
    return content;
  }
}

void main() async {
  AuthService.instance.login();

  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: AppSCreen()));
}



