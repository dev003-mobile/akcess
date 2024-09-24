
import 'package:http/http.dart' as http;

import 'i_http_client.dart';
import '../enums/http_method_enum.dart';

class HttpClientImp implements IHttpClient {
  @override
  Future<http.Response> get(String url, {Map<String, String>? headers}) async => 
    _request(url, headers: headers);

  @override
  Future<http.Response> post(String url, {body, Map<String, String>? headers}) async => 
    _request(url, body: body, headers: headers, method: HttpMethodEnum.post);


  @override
  Future<http.Response> put(String url, {body, Map<String, String>? headers}) async =>
    _request(url, body: body, headers: headers, method: HttpMethodEnum.put);

  @override
  Future<http.Response> delete(String url, {body, Map<String, String>? headers}) async => 
    _request(url, body: body, headers: headers, method: HttpMethodEnum.delete);

  Future<http.Response> _request(
    String url, {
      HttpMethodEnum? method = HttpMethodEnum.get, 
      dynamic body, 
      Map<String, String>? headers
    }) async => switch (method) {
      HttpMethodEnum.get => http.get(Uri.parse(url), headers: headers,),
      HttpMethodEnum.post => http.post(Uri.parse(url), body: body, headers: headers),
      HttpMethodEnum.put => http.put(Uri.parse(url), body: body, headers: headers),
      HttpMethodEnum.delete => http.delete(Uri.parse(url), body: body, headers: headers),
      _ => http.get(Uri.parse(url), headers: headers)
    };
}