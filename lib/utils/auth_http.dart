import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthHttp {
  static const String _userAgent = 'Mozilla/5.0 (compatible; GroqSDK/1.0)';

  static Future<http.Response> get(
      {required String url, required String apiKey}) async {
    return http.get(Uri.parse(url), headers: {
      'Authorization': 'Bearer $apiKey',
      'User-Agent': _userAgent,
    });
  }

  static Future<http.Response> post(
      {required String url,
      required String apiKey,
      required Map<String, dynamic> body}) async {
    return http.post(Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $apiKey',
          'Content-Type': 'application/json',
          'User-Agent': _userAgent,
        },
        body: json.encode(body));
  }
}
