import 'dart:convert';
import 'dart:io';

import 'package:samduapp/config/configuration.dart';
import 'package:samduapp/domain/api_client/api_client_exception.dart';
import 'package:samduapp/domain/entity/book.dart';
import 'package:samduapp/domain/entity/fakultet.dart';

class NetworkClient {
  final _client = HttpClient();
  Uri _makeUri(String path, [Map<String, dynamic>? parametrs]) {
    final uri = Uri.parse(path);
    if (parametrs != null) {
      return uri.replace(queryParameters: parametrs);
    } else {
      return uri;
    }
  }

  Future<T> post<T>(String path, T Function(dynamic json) parser,
      [Map<String, dynamic>? bodyParametrs]) async {
    try {
      final url = _makeUri(path, bodyParametrs);
      final request = await _client.postUrl(url);
      request.headers.contentType = ContentType.json;
      request.write(jsonEncode(bodyParametrs));
      final response = await request.close();
      final dynamic json = (await response.jsonDecode());
      _validateResponse(response, json);
      final result = parser(json);
      return result;
    } on SocketException {
      throw ApiClientException(ApiClientExceptionType.network);
    } on ApiClientException {
      rethrow;
    } catch (e) {
      // print(e);
      throw ApiClientException(ApiClientExceptionType.other);
    }
  }

  Future<T> get<T>(token, String path, T Function(dynamic json) parser,
      [Map<String, dynamic>? parametrs]) async {
    final url = _makeUri(path, parametrs);
    try {
      final request = await _client.getUrl(url);
      request.headers.add('Authorization', 'Bearer $token');

      final response = await request.close();
      // final String responseBody = await response.transform(utf8.decoder).join();
      // return jsonDecode(responseBody);
      final dynamic json = (await response.jsonDecode());

      _validateResponse(response, json);

      final result = parser(json);
      return result;
    } on SocketException {
      throw ApiClientException(ApiClientExceptionType.network);
    } on ApiClientException {
      rethrow;
    } catch (e) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
  }

  Future<T> getWithoutKey<T>(
      token, String path, T Function(dynamic json) parser,
      [Map<String, dynamic>? parametrs, List? bodyParametrs]) async {
    final url = _makeUri(path, parametrs);
    try {
      final request = await _client.getUrl(url);
      request.headers.add('Authorization', 'Bearer $token');

      final response = await request.close();
      final dynamic json = (await response.jsonDecode());
      // final jsonStrings = await response.transform(utf8.decoder).toList();
      // final jsonString = jsonStrings.join();
      // // return jsonDecode(responseBody);
      // final json = await jsonDecode(jsonString) as List<dynamic>;

      _validateResponseNew(response, json);

      final result = parser(json);

      return result;
    } on SocketException {
      throw ApiClientException(ApiClientExceptionType.network);
    } on ApiClientException {
      rethrow;
    } catch (e) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
  }

  Future<T> getWithoutKeyTest<T>(token, String path,
      [Map<String, dynamic>? parametrs]) async {
    final url = _makeUri(path, parametrs);
    try {
      final request = await _client.getUrl(url);
      request.headers.add('Authorization', 'Bearer $token');

      final response = await request.close();
      final dynamic json = (await response.jsonDecode());
      // final jsonStrings = await response.transform(utf8.decoder).toList();
      // final jsonString = jsonStrings.join();
      // // return jsonDecode(responseBody);
      // final json = await jsonDecode(jsonString) as List<dynamic>;

      _validateResponseNew(response, json);

      return json;
    } on SocketException {
      throw ApiClientException(ApiClientExceptionType.network);
    } on ApiClientException {
      rethrow;
    } catch (e) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
  }

  Future<List<Book>?> getBooks(
    String token,
    String query,
  ) async {
    try {
      final url = Uri.parse('$baseURL/users-library?name=$query');
      final request = await _client.getUrl(url);
      request.headers.set('Authorization', 'Bearer $token');
      final response = await request.close();
      final jsonStrings = await response.transform(utf8.decoder).toList();
      final jsonString = jsonStrings.join();
      if (response.statusCode == 404) return null;
      final json = jsonDecode(jsonString) as List<dynamic>;

      final books = json
          .map((dynamic e) => Book.fromJson(e as Map<String, dynamic>))
          .toList();

      return books;
    } on SocketException {
      throw ApiClientException(ApiClientExceptionType.network);
    } on ApiClientException {
      rethrow;
    } catch (e) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
  }

  void _validateResponse(
      HttpClientResponse response, Map<String, dynamic> json) {
    if (response.statusCode == 401) {
      final status = json['status_code'];
      final code = status is int ? status : 0;
      if (code == 30) {
        throw ApiClientException(ApiClientExceptionType.auth);
      } else if (code == 3) {
        throw ApiClientException(ApiClientExceptionType.sessionExpired);
      } else {
        throw ApiClientException(ApiClientExceptionType.other);
      }
    }
  }

  void _validateResponseNew(HttpClientResponse response, List<dynamic> json) {
    for (var element in json) {
      if (response.statusCode == 401) {
        final status = element['status_code'];
        final code = status is int ? status : 0;
        if (code == 30) {
          throw ApiClientException(ApiClientExceptionType.auth);
        } else if (code == 3) {
          throw ApiClientException(ApiClientExceptionType.sessionExpired);
        } else {
          throw ApiClientException(ApiClientExceptionType.other);
        }
      }
    }
  }
}

extension HttpClientResponseJsonDecode on HttpClientResponse {
  Future<dynamic> jsonDecode() async {
    return transform(utf8.decoder).toList().then((value) {
      final result = value.join();
      return result;
    }).then<dynamic>((v) => json.decode(v));
  }
}
