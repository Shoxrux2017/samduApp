import 'dart:io';

import 'package:samduapp/domain/api_client/anketa_api_client.dart';

import 'package:samduapp/domain/data_providers/session_data_provider.dart';
import 'package:samduapp/domain/entity/user.dart';

class AnketaService {
  final _sessionDataProvider = SessionDataProvider();
  final _anketaApiClient = AnketaApiClient();

  Future<void> saveAvatarImg(file) async {
    final userIdString = await _sessionDataProvider.idUser;
    final token = await _sessionDataProvider.tokenUser;
    if (userIdString == null || token == null) return;
    // await _sessionDataProvider.setAvatarUser(userId, imagePath);
    final userId = int.parse(userIdString);
    await _anketaApiClient.uploadAvatarImage(userId, token, file);
  }

  Future<User?> getImageForAvatar(teacherId) async {
    final token = await _sessionDataProvider.tokenUser;

    var _teacherId;
    final getToken = await _sessionDataProvider.tokenUser;
    final userId = await _sessionDataProvider.idUser;
    final statusUser = await _sessionDataProvider.statusUser;
    if (userId == null || getToken == null) return null;
    if (statusUser == "1") {
      _teacherId = teacherId;
    } else if (statusUser == "2") {
      _teacherId = userId;
    }

    final userInfo = await _anketaApiClient.userInfo(_teacherId, token);
    if (userInfo != null) {
      return userInfo;
    }

    return null;
  }

  Future<File?> pickImage() async {
    final file = await _anketaApiClient.pickImage();

    if (file != null) {
      return file;
    }
    return null;
  }
}
