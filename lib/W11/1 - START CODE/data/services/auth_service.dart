import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../model/auth_session.dart';
import '../../model/user.dart';

class AuthenticationService {
  static AuthenticationService instance = AuthenticationService();

  AuthSession? session;

  bool get isLoggedIn => session != null;

  Future<void> login({required String name, required String password}) async {
    final Uri baseUri = Uri.parse("http://localhost:3000");
    final Uri loginUrl = baseUri.replace(path: "login");

    // 1- Create the JSON body with the name and password

    Map<String, dynamic> body = {"name": "ronan", "password": "thebest"};

    // 2- Fetch the POST/login
    Response response = await http.post(
      loginUrl,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );
    // 3- Decode the json

    Map<String, dynamic> json = jsonDecode(response.body);

    // 4 - If failed, throw a AuthException
    if (response.statusCode != 200) {
      String error = json["error"];
      throw Exception("Error: \n $error");
    }
    // 5 -  Get the token
    String token = json["token"];

    // 5 -  Get the user
    User user = User.fromJSon(json['user']);

    // 6 - Update the session
    session = AuthSession(token: token, user: user);
  }
}

class AuthException implements Exception {
  final String message;

  AuthException(this.message);
  @override
  String toString() {
    return message;
  }
}
