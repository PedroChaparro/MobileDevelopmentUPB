import 'dart:convert';
import 'package:http/http.dart' as http;

class SessionServices {
  var url = 'http://192.168.1.15:3030';

  Future<Map<String, dynamic>> postLoginEndpoint(
      Map<String, String> payload) async {
    final response = await http.post(
      Uri.parse('$url/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(payload),
    );

    final data = jsonDecode(response.body);
    return data;
  }
}
