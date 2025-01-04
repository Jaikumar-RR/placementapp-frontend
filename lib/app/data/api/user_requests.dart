import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/user_model.dart';
import '../token/token_storage.dart';
import 'urls.dart';

class UserRequests {
  static Future<User> getUserData(String userId) async {
    try {
      String? token = await TokenStorage.getAccessToken();

      if (token.isEmpty) {
        throw Exception('Token is empty');
      }

      String endpoint = "${Urls.userUrl}/$userId";
      final response = await http.get(Uri.parse(endpoint), headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      });
      if (response.statusCode == 200) {
        return User.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Cannot get user');
      }
    } catch (e) {
      throw Exception("Failed to get user id");
    }
  }
}
