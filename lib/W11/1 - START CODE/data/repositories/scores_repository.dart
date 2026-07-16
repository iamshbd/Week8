import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../model/auth_session.dart';
import '../../model/score.dart';
import '../services/auth_service.dart';

class ScoresRepository {
  static ScoresRepository instance = ScoresRepository();

  Future<List<Score>> getSCores() async {
    final Uri baseUri = Uri.parse("http://localhost:3000");
    final Uri scoresUri = baseUri.replace(path: "/scores");

    AuthSession? session = AuthenticationService.instance.session;
    if (session == null) {
      throw Exception("Cannot fetch without authentication");
    }

    // Fetch the GET /scores with the token included in the headers
    Response response = await http.get(
      scoresUri,
      headers: {
        "Authorization": "Bearer ${session.token}",
        "Content-Type": " application/json",
      },
    );

    //  If statusCode 200, decode the json body
    if (response.statusCode != 200) {
      throw Exception("Error fetching.");
    }

    // Convert the json to the lost of scores
    

    // Ifd success Return the scores

    // If no success throw exception

    return []; // fake
  }
}
