import 'package:http/http.dart' as http;

abstract class IHttpClient {
  Future<http.Response> get(String url, {Map<String, String>? headers});
  Future<http.Response> post(String url, {String? body, Map<String, String>? headers});
  Future<http.Response> put(String url, {String? body, Map<String, String>? headers});
  Future<http.Response> delete(String url, {String? body, Map<String, String>? headers});
}