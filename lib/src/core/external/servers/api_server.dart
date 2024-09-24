import 'package:http/http.dart' as http;

import '../../presenter/utils/clients/i_http_client.dart';
import '../../presenter/utils/enums/http_method_enum.dart';

class APIServer {
  final IHttpClient iHttpClient;

  APIServer(this.iHttpClient);

  Future<http.Response> get(String url, {String? authorization}) async => _request(url, authorization: authorization);

  Future<http.Response> post(String url, {dynamic body, String? authorization}) async => _request(url, body: body, method: HttpMethodEnum.post, authorization: authorization);

  Future<http.Response> put(String url, {dynamic body, String? authorization}) async => _request(url, body: body, method: HttpMethodEnum.put, authorization: authorization);

  Future<http.Response> delete(String url, {dynamic body, String? authorization}) async => _request(url, body: body, method: HttpMethodEnum.delete, authorization: authorization);

  Future<http.Response> _request(String url, {HttpMethodEnum? method = HttpMethodEnum.get, dynamic body, String? authorization}) async {
    late Map<String, String> headers;

    if (authorization != null) {
      headers = <String, String>{
        "content-type": "application/json",
        "Authorization": "Bearer $authorization"
      };
    } else {
      headers = <String, String>{"content-type": "application/json"};
    }

    return switch (method) {
      HttpMethodEnum.get => await iHttpClient.get(url, headers: headers),
      HttpMethodEnum.post => await iHttpClient.post(url, headers: headers, body: body),
      HttpMethodEnum.put => await iHttpClient.put(url, body: body, headers: headers),
      HttpMethodEnum.delete => await iHttpClient.delete(url, body: body, headers: headers),
      _ => await iHttpClient.get(url, headers: headers)
    };
  }
}