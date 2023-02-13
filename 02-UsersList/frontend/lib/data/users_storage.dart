import 'dart:convert';
import "package:http/http.dart" as http;

class UsersStorage {
  Future<List<Map>> getAllUsers() async {
    await Future.delayed(Duration(seconds: 1));
    String target = "https://api.npoint.io/d3bad65d7cc90006cb37";

    try {
      final response = await http.get(Uri.parse(target));
      dynamic data = jsonDecode(utf8.decode(response.bodyBytes));
      return List<Map>.from(data["users"]);
    } catch (e) {
      return [];
    }
  }
}
