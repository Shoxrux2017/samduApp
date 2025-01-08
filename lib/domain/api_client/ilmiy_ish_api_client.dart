import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:samduapp/config/configuration.dart';
import 'package:samduapp/domain/api_client/network_client.dart';
import 'package:samduapp/domain/entity/ilmiy_ish_response.dart';

class IlmiyIshApiClient {
  final HttpClient _httpClient = HttpClient();
  final _networkClient = NetworkClient();
  final _client = HttpClient();
  Future<void> uploadIlmiyIsh(
    doi,
    coAuthor,
    file, {
    required int userId,
    required String title,
    required String publish,
    required int year,
    required int page,
    required String author,
    required int authorCount,
    required String category,
    required String publishType,
    required String publishLevel,
    required String publishLanguage,
    required String studyYear,
    required String token,
  }) async {
    try {
      final url = Uri.parse(
          '$uploadIlmiyIshUrl?userId=$userId&title=$title&publish=$publish&year=$year&page=$page&author=$author&coAuthor=$coAuthor&authorCount=$authorCount&doi=$doi&scienceCategory=$category&publishType=$publishType&publishLevel=$publishLevel&publishLanguage=$publishLanguage&studyYear=$studyYear');

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
      print(e);
    }
  }

  Future<List<IlmiyIshResponse>> downloadIlmiyIsh({
    required int id,
    required String token,
  }) async {
    parser(dynamic json) {
      List<IlmiyIshResponse> response = [];
      for (var element in json) {
        final jsonMap = element as Map<String, dynamic>;
        response.add(IlmiyIshResponse.fromJson(jsonMap));
      }
      return response;
    }

    final result = await _networkClient.getWithoutKey(
      token,
      getIlmiyIshUrl,
      parser,
    );
    return result;
  }

  Future<List<IlmiyIshResponse>?> searchIlmiyIsh(
    String? searchQuery,
    List<String>? filterQuery,
    List<String>? sortingQuery, {
    required int id,
    required String token,
  }) async {
    // parser(dynamic json) {
    //   List<IlmiyIshResponse> response = [];
    //   for (var element in json) {
    //     final jsonMap = element as Map<String, dynamic>;
    //     response.add(IlmiyIshResponse.fromJson(jsonMap));
    //   }
    //   return response;
    // }

    if (filterQuery == []) filterQuery = null;
    if (sortingQuery == []) sortingQuery = null;
    if (searchQuery == "") searchQuery = null;

    // Convert the list to JSON string
    final jsonData = json.encode({
      'search': searchQuery,
      'filter': filterQuery,
      'sorting': sortingQuery
    });

    // Set the JSON data as the request body

    final request = await _client.postUrl(Uri.parse(searchIlmiyIshUrl));

    request.headers.add('Authorization', 'Bearer $token');
    request.headers.set('Content-Type', 'application/json; charset=UTF-8');
    request.write(jsonData);
    final response = await request.close();
    final dynamic jsonn = (await response.jsonDecode());
    // final jsonStrings = await response.transform(utf8.decoder).toList();
    // final jsonString = jsonStrings.join();
    // // return jsonDecode(responseBody);
    // final json = await jsonDecode(jsonString) as List<dynamic>;
    if (jsonn == null) return null;
    List<IlmiyIshResponse> result = [];
    for (var element in jsonn) {
      final jsonMap = element as Map<String, dynamic>;
      result.add(IlmiyIshResponse.fromJson(jsonMap));
    }

    return result;

    // final parameters = searchWorks;

    // final result = await _networkClient.getWithoutKey(
    //     token, searchScienceWorksUrl, parser, bodyParametrsLparameters);
    // return result;
  }

  Future<List<String>> getScienceCategory(
    token,
  ) async {
    // parser(dynamic json) {
    //   List<Fakultet> response = [];
    //   for (var element in json) {
    //     final jsonMap = element as Map<String, dynamic>;
    //     response.add(Fakultet.fromJson(jsonMap));
    //   }
    //   // final result = json
    //   //     .map((dynamic e) => Fakultet.fromJson(e as Map<String, dynamic>))
    //   //     .toList();

    //   return response;
    // }
    List<String> result = [];
    final response =
        await (_networkClient.getWithoutKeyTest(token, getScienceCategoryUrl));
    for (var res in response) {
      result.add(res['title']);
    }
    return result;
  }

  Future<List<String>> getPublishType(
    token,
  ) async {
    List<String> result = [];
    final response =
        await (_networkClient.getWithoutKeyTest(token, getPublishTypeUrl));
    for (var res in response) {
      result.add(res['title']);
    }
    return result;
  }

  Future<List<String>> getPublishLevel(
    token,
  ) async {
    List<String> result = [];
    final response =
        await (_networkClient.getWithoutKeyTest(token, getPublishLevelUrl));
    for (var res in response) {
      result.add(res['title']);
    }
    return result;
  }

  Future<List<String>> getPublishLanguage(
    token,
  ) async {
    List<String> result = [];
    final response =
        await (_networkClient.getWithoutKeyTest(token, getNashrTiliUrl));
    for (var res in response) {
      result.add(res['til']);
    }
    return result;
  }

  Future<List<String>> getOquvYili(
    token,
  ) async {
    List<String> result = [];
    final response =
        await (_networkClient.getWithoutKeyTest(token, getOquvYiliUrl));
    for (var res in response) {
      result.add(res['oquv_yili']);
    }
    return result;
  }

  Future<List<String>> getNashrYili(
    token,
  ) async {
    List<String> result = [];
    final response =
        await (_networkClient.getWithoutKeyTest(token, getNashrYiliUrl));
    for (var res in response) {
      result.add(res['nashr_yili']);
    }
    return result;
  }
}
