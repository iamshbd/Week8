import 'dart:convert';

import 'package:http/http.dart' as http;
//import 'package:my_flutter_app/W9/1%20-%20START%20CODE/data/repository/repository_exception.dart';
import '../dto/todo_dto.dart';
import '../../models/todo.dart';
import 'repository_exception.dart';

class TodoRepository {
  static final global = TodoRepository(); // unique instance

  final List<Todo> fakeTodos = [
    Todo(id: '1', title: 'Buy groceries', completed: false),
    Todo(id: '2', title: 'Finish Flutter homework', completed: true),
    Todo(id: '3', title: 'Call the dentist', completed: false),
    Todo(id: '4', title: 'Read 20 pages of a book', completed: true),
    Todo(id: '5', title: 'Go for a 30-minute walk', completed: false),
  ];

  static const String _baseUrl =
      'https://honeypot-c1a49-default-rtdb.asia-southeast1.firebasedatabase.app';

  Future<List<Todo>> getTodos() async {
    try {
      final url = Uri.parse('$_baseUrl/todos.json');
      final response = await http.get(url);
      if (response.statusCode != 200) {
        throw RepositoryException(
          "failed to fetch todo(status ${response.statusCode})",
        );
      }

      final decoded = jsonDecode(response.body);
      if (decoded == null) return [];
      final Map<String, dynamic> data = decoded as Map<String, dynamic>;

      return data.entries.map((entry) {
        return TodoDto.fromJson(entry.key, entry.value as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      // Fallback to fake data if Firebase is not available
      return fakeTodos;
    }
  }

  Future<void> updateCompleted(String todoId, bool completed) async {
    //  TODO
    //  Adapt the code to handle firebase data fetch
    //

    final url = Uri.parse('$_baseUrl/todos/$todoId.json');

    final response = await http.patch(
      url,
      body: jsonEncode({'completed': completed}),
    );
    if (response.statusCode != 200) {
      throw RepositoryException(
        "failed to update todo $todoId (status ${response.statusCode})",
      );
    }
  }
}
