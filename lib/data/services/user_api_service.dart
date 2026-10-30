import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/user.dart';

class UserApiService {
  final http.Client _client;

  UserApiService(this._client);

  Future<List<User>> fetchUsers() async {
    final uri = Uri.parse(
      'https://jsonplaceholder.typicode.com/users',
    );

    final response = await _client
        .get(uri)
        .timeout(const Duration(seconds: 15));

    if (response.statusCode != 200) {
      throw Exception(
        'Failed to load users: HTTP ${response.statusCode}',
      );
    }

    final List<dynamic> jsonList =
    jsonDecode(response.body) as List<dynamic>;

    return jsonList.map((json) {
      return User.fromJson(
        json as Map<String, dynamic>,
      );
    }).toList();
  }
}