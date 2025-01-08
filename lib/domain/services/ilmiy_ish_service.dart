import 'package:flutter/material.dart';
import 'package:samduapp/domain/api_client/ilmiy_ish_api_client.dart';
import 'package:samduapp/domain/data_providers/session_data_provider.dart';
import 'package:samduapp/domain/entity/ilmiy_ish_response.dart';

class IlmiyIshService {
  final _sessionDataProvider = SessionDataProvider();
  final _ilmiyIshApiClient = IlmiyIshApiClient();

  Future<void> uploadIlmiyIsh(
    file,
    doi,
    coAuthor, {
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
  }) async {
    final getToken = await _sessionDataProvider.tokenUser;
    final userIdString = await _sessionDataProvider.idUser;
    if (userIdString == null || getToken == null) return;
    final userId = int.parse(userIdString);
    await _ilmiyIshApiClient.uploadIlmiyIsh(
      doi,
      coAuthor,
      file,
      userId: userId,
      title: title,
      publish: publish,
      year: year,
      page: page,
      author: author,
      authorCount: authorCount,
      category: category,
      publishType: publishType,
      publishLevel: publishLevel,
      publishLanguage: publishLanguage,
      studyYear: studyYear,
      token: getToken,
    );
  }

  Future<List<IlmiyIshResponse>?> downloadIlmiyIsh() async {
    final getToken = await _sessionDataProvider.tokenUser;
    final userIdString = await _sessionDataProvider.idUser;

    if (userIdString == null || getToken == null) return null;
    final teacherId = await _sessionDataProvider.idTeacher;
    final id = int.parse(teacherId!);
    return await _ilmiyIshApiClient.downloadIlmiyIsh(id: id, token: getToken);
  }

  Future<List<IlmiyIshResponse>?> searchIlmiyIsh(String? searchQuery,
      List<String>? filterQuery, List<String>? sortingQuery) async {
    final getToken = await _sessionDataProvider.tokenUser;
    final userIdString = await _sessionDataProvider.idUser;

    if (userIdString == null || getToken == null) return null;
    final teacherId = await _sessionDataProvider.idTeacher;
    final id = int.parse(teacherId!);

    return await _ilmiyIshApiClient.searchIlmiyIsh(
        searchQuery, filterQuery, sortingQuery,
        id: id, token: getToken);
  }

  Future<List<String>> getScienceCategory() async {
    final getToken = await _sessionDataProvider.tokenUser;

    return await _ilmiyIshApiClient.getScienceCategory(getToken);
  }

  Future<List<String>> getPublishType() async {
    final getToken = await _sessionDataProvider.tokenUser;

    return await _ilmiyIshApiClient.getPublishType(getToken);
  }

  Future<List<String>> getPublishLevel() async {
    final getToken = await _sessionDataProvider.tokenUser;

    return await _ilmiyIshApiClient.getPublishLevel(getToken);
  }

  Future<List<String>> getPublishLanguage() async {
    final getToken = await _sessionDataProvider.tokenUser;

    return await _ilmiyIshApiClient.getPublishLanguage(getToken);
  }

  Future<List<String>> getStudyYear() async {
    final getToken = await _sessionDataProvider.tokenUser;

    return await _ilmiyIshApiClient.getOquvYili(getToken);
  }
}
