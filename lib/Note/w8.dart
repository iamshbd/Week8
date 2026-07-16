import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Todo {
  // YOUR CODE
  final int id;
  final int userID;
  final String title;
  final bool completed;
  Todo({
    required this.id,
    required this.userID,
    required this.title,
    required this.completed,
  });
}

Future<Todo> fetchTodo() async {
  Uri url = Uri.parse("https://jsonplaceholder.typicode.com/todos/3");

  Response response = await http.get(url);

  Map<String, dynamic> json =
      convert.jsonDecode(response.body) as Map<String, dynamic>;

  Todo result = Todo();
  // YOUR CODE
  return result;
}

void main() async {
  // Call the fetch and dispaly the TODO
}

class Todo {
  final int id;
  final int userId;
  final String title;
  final bool completed;

  Todo({
    required this.id,
    required this.userId,
    required this.title,
    required this.completed,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'] as int,
      userId: json['userId'] as int,
      title: json['title'] as String,
      completed: json['completed'] as bool,
    );
  }

  @override
  String toString() {
    return 'Todo(id: $id, userId: $userId, title: "$title", completed: $completed)';
  }
}

Future<Todo> fetchTodo(int todoId) async {
  Uri url = Uri.parse("https://jsonplaceholder.typicode.com/todos/$todoId");

  Response response = await http.get(url);

  Map<String, dynamic> json =
      convert.jsonDecode(response.body) as Map<String, dynamic>;

  Todo result = Todo.fromJson(json);
  return result;
}

void main() async {
  Todo todo = await fetchTodo(3);
  print(todo);
}
