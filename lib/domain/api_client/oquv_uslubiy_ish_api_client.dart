import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:samduapp/config/configuration.dart';
import 'package:samduapp/domain/api_client/network_client.dart';
import 'package:samduapp/domain/entity/oquv_uslubiy_ish_response.dart';

class OquvUslubiyIshApiClient {
  final HttpClient _httpClient = HttpClient();
  final _networkClient = NetworkClient();
  final _client = HttpClient();

  Future<void> uploadIlmiyIsh(
    file,
    guvohnomaRaqami,
    nashriyoti, {
    required String uslubiyNashrNomi,
    required String mualliflari,
    required String mualliflarSoni,
    required String nashrParametrlari,
    required String guvohnomaSanasi,
    //from drop down
    required String uslubiyNashrTuri,
    required String uslubiyNashrTili,
    required String uslubiyNashrYili,
    required String uslubiyNashrOquvYili,
    required int userId,
    required String token,
  }) async {
    try {
      // final url = Uri.parse(
      //     '$uploadIlmiyIshUrl?userId=$userId&nomi=$nomi&mualliflari=$mualliflari&mualliflarSoni=$mualliflarSoni&nashrParametrlari=$nashrParametrlari&guvohnomaSanasi=$guvohnomaSanasi&uslubiyNashrTuri=$uslubiyNashrTuri&uslubiyNashrTili=$uslubiyNashrTili&uslubiyNashrYili=$uslubiyNashrYili&uslubiyNashrOquvYili=$uslubiyNashrOquvYili');

      final url = Uri.parse(uploadOquvUslubiyIshUrl);

      await _httpClient.postUrl(url);
      var multipartFile = await http.MultipartFile.fromPath('file', file.path);
      var multipartRequest = http.MultipartRequest('POST', url)
        ..headers['Authorization'] = 'Bearer $token'
        ..headers['Accept'] = 'application/json'
        ..files.add(multipartFile);

      multipartRequest.fields['uslubiyNashrNomi'] = uslubiyNashrNomi;
      multipartRequest.fields['userId'] = userId.toString();
      multipartRequest.fields['mualliflar'] = mualliflari;
      multipartRequest.fields['mualliflarSoni'] = mualliflarSoni;
      multipartRequest.fields['nashriyot'] = nashriyoti;
      multipartRequest.fields['nashrParametrlari'] = nashrParametrlari;
      multipartRequest.fields['guvohnomaSanasi'] = guvohnomaSanasi;
      multipartRequest.fields['guvohnomaRaqami'] = guvohnomaRaqami;
      //from drop down
      multipartRequest.fields['uslubiyNashrTuri'] = uslubiyNashrTuri;
      multipartRequest.fields['uslubiyNashrTili'] = uslubiyNashrTili;
      multipartRequest.fields['uslubiyNashrYili'] = uslubiyNashrYili;
      multipartRequest.fields['uslubiyNashrOquvYili'] = uslubiyNashrOquvYili;

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

  Future<List<OquvUslubiyIshResponse>> downloadOquvUslubiyIsh({
    required int id,
    required String token,
  }) async {
    parser(dynamic json) {
      List<OquvUslubiyIshResponse> response = [];
      for (var element in json) {
        final jsonMap = element as Map<String, dynamic>;
        response.add(OquvUslubiyIshResponse.fromJson(jsonMap));
      }
      return response;
    }

    final result = await _networkClient.getWithoutKey(
      token,
      getOquvUslubiyIshUrl,
      parser,
    );
    return result;
  }

  Future<List<OquvUslubiyIshResponse>?> searchOquvUslubiyIsh(
    String? searchQuery,
    List<String>? filterQuery, {
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
    if (searchQuery == "") searchQuery = null;

    // Convert the list to JSON string
    final jsonData = json.encode({
      'search': searchQuery,
      'filter': filterQuery,
    });

    // Set the JSON data as the request body

    final request = await _client.postUrl(Uri.parse(searchOquvUslubiyIshUrl));

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
    List<OquvUslubiyIshResponse> result = [];
    for (var element in jsonn) {
      final jsonMap = element as Map<String, dynamic>;
      result.add(OquvUslubiyIshResponse.fromJson(jsonMap));
    }

    return result;

    // final parameters = searchWorks;

    // final result = await _networkClient.getWithoutKey(
    //     token, searchScienceWorksUrl, parser, bodyParametrsLparameters);
    // return result;
  }

  Future<List<String>> getUslubiyNashrTuri(
    token,
  ) async {
    List<String> result = [];
    final response =
        await (_networkClient.getWithoutKeyTest(token, getUslubiyNashrTuriUrl));
    for (var res in response) {
      result.add(res['nashr_turi']);
    }
    return result;
  }

  Future<List<String>> getNashrTili(
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
