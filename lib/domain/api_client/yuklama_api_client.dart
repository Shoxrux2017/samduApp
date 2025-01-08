import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:samduapp/config/configuration.dart';
import 'package:samduapp/domain/api_client/network_client.dart';
import 'package:samduapp/domain/entity/book.dart';
import 'package:samduapp/domain/entity/favorite_book.dart';

class YuklamaApiClient {
  final HttpClient _httpClient = HttpClient();
  final _networkClient = NetworkClient();

  Future<void> doFavourite(
      int userId, String bookId, String token, bool isFav) async {
    late final int resFav;
    try {
      if (isFav) {
        resFav = 1;
      } else {
        resFav = 0;
      }

      final url = Uri.parse(
          '$baseURL/isFavourite?userId=$userId&bookId=$bookId&isFavourite=$resFav');
      final request = await _httpClient.getUrl(url);
      request.headers.contentType = ContentType.json;
      request.headers.set('Authorization', 'Bearer $token');
      await request.close();
    } catch (e) {
      // print(e);
    }
  }

  Future<List<FavoriteBook>?> getFavorite(int userId, String token) async {
    try {
      final url = Uri.parse('$baseURL/getFavorite?userId=$userId');
      final request = await _httpClient.getUrl(url);
      request.headers.contentType = ContentType.json;
      request.headers.set('Authorization', 'Bearer $token');
      final response = await request.close();
      final jsonStrings = await response.transform(utf8.decoder).toList();
      final jsonString = jsonStrings.join();
      if (response.statusCode == 404) {
        return null;
      }
      final json = jsonDecode(jsonString) as List<dynamic>;

      final books = json
          .map((dynamic e) => FavoriteBook.fromJson(e as Map<String, dynamic>))
          .toList();

      return books;
    } catch (e) {
      // print(e);
    }
    return null;
  }

  Future<void> downloadYuklama(
    int userId,
    String categoryFile,
    String token,
  ) async {
    try {
      var downloadData = <int>[];
      var myPath;
      if (Platform.isAndroid) {
        myPath = File('/storage/emulated/0/Download/$categoryFile.pdf');
      } else if (Platform.isWindows) {
        final directory = await getDownloadsDirectory();
        final String filePath = '${directory?.path}/$categoryFile.pdf';
        myPath = File(filePath);
      }

      final Uri uri = Uri.parse(
          '$downloadYuklamaUrl?user_id=$userId&category_file=$categoryFile');

      await _httpClient.getUrl(uri).then((HttpClientRequest request) {
        request.headers.set(HttpHeaders.authorizationHeader, 'Bearer $token');
        request.headers.set(HttpHeaders.contentTypeHeader, 'application/son');
        return request.close();
      }).then((HttpClientResponse response) {
        // print(response.statusCode);
        response.listen((d) => downloadData.addAll(d), onDone: () {
          myPath.writeAsBytes(downloadData);
        });
      });
    } catch (error) {
      // print('Error downloading file: $error');
    } finally {
      //_httpClient.close();
    }
  }

  Future<void> uploadFile(
    int userId,
    String categoryFile,
    String token,
    File file,
  ) async {
    try {
      final url = Uri.parse(
          '$uploadYuklamaUrl?user_id=$userId&category_file=$categoryFile');
      await _httpClient.postUrl(url);
      var multipartFile = await http.MultipartFile.fromPath('file', file.path);
      var multipartRequest = http.MultipartRequest('POST', url)
        ..headers['Authorization'] = 'Bearer $token'
        ..headers['Accept'] = 'application/json'
        ..files.add(multipartFile);

      var streamedResponse = await multipartRequest.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        // print('File uploaded successfully');
      } else {
        // print('Failed to upload file. Status code: ${response.statusCode}');
      }

      // final request = http.MultipartRequest('POST', url);
      // request.headers['Authorization'] = 'Bearer $token';
      // request.headers['Content-Type'] = 'application/json';
      // final multipartFile =
      //     await http.MultipartFile.fromPath('file', file.path);
      // request.files.add(multipartFile);

      // final streamedResponse = await request.send();
      // final response = await http.Response.fromStream(streamedResponse);

      // print(response.statusCode);
    } catch (e) {
      // print(e);
    }
  }

  Future<List<Book>?> searchBook(
    String token,
    String query,
  ) async {
    final result = await _networkClient.getBooks(token, query);

    return result;
  }

  Future<String?> openBook(String token, String id) async {
    final url = Uri.parse('$baseURL/users-library/create?id=$id');
    final request = await _httpClient.getUrl(url);
    request.headers.set('Authorization', 'Bearer $token');
    final response = await request.close();
    final jsonStrings = await response.transform(utf8.decoder).toList();
    final jsonString = jsonStrings.join();

    if (response.statusCode == 404) {
      return null;
    }
    final json = jsonDecode(jsonString) as Map<String, dynamic>;

    final bookUrl = json['book_URL'] as String;

    return bookUrl;
  }

  Future<String?> getBook(String token, String id) async {
    final url = Uri.parse('$baseURL/users-library/create?id=$id');
    final request = await _httpClient.getUrl(url);
    request.headers.set('Authorization', 'Bearer $token');
    final response = await request.close();
    final jsonStrings = await response.transform(utf8.decoder).toList();
    final jsonString = jsonStrings.join();

    if (response.statusCode == 404) {
      return null;
    }
    final json = jsonDecode(jsonString) as Map<String, dynamic>;

    final bookUrl = json['book_URL'] as String;

    return bookUrl;
  }

  Future<String?> checkingFile(
    int userId,
    String categoryFile,
    String token,
  ) async {
    parser(dynamic json) {
      // final jsonMap = json as Map<String, String>;
      if (json.containsKey('id')) {
        final response = json["id"];
        return response;
      }
      return null;
    }

    final result = await _networkClient.get(token,
        '$checkingFileUrl?user_id=$userId&category_file=$categoryFile', parser);

    return result;
  }

  Future<String?> deleteNamunaviyFile(
    int userId,
    String categoryFile,
    String token,
  ) async {
    try {
      parser(dynamic json) {
        // final jsonMap = json as Map<String, String>;
        final response = json['message'];
        return response;
      }

      final result = await _networkClient.get(token,
          '$deleteFile?user_id=$userId&category_file=$categoryFile', parser);
      if (result == "File deleted.") {
        return result;
      } else {
        return null;
      }
    } catch (e) {
      return null;
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
