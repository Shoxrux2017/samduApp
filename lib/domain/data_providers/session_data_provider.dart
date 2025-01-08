import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class _Keys {
  static const tokenUser = 'token';
  static const idUser = 'id';
  static const statusUser = 'statusId';
  static const idTeacher = 'idTeacher';
}

class SessionDataProvider {
  static const _secureStorage = FlutterSecureStorage();

  // ----------------------- Set User Token------------------------//

  Future<String?> get tokenUser => _secureStorage.read(key: _Keys.tokenUser);

  Future<void> setTokenUser(String? token) {
    return _secureStorage.write(key: _Keys.tokenUser, value: token);
  }

  Future<void> deleteTokenUser() {
    return _secureStorage.delete(key: _Keys.tokenUser);
  }

// ----------------------- Set User ID------------------------//
  Future<String?> get idUser => _secureStorage.read(key: _Keys.idUser);

  Future<void> setUserId(int? id) {
    return _secureStorage.write(key: _Keys.idUser, value: id.toString());
  }

  Future<void> deleteUserId() {
    return _secureStorage.delete(key: _Keys.idUser);
  }

// ----------------------- Set Teacher ID------------------------//
  Future<String?> get idTeacher => _secureStorage.read(key: _Keys.idTeacher);

  Future<void> setTeacherId(int? id) {
    return _secureStorage.write(key: _Keys.idTeacher, value: id.toString());
  }

  Future<void> deleteTeacherId() {
    return _secureStorage.delete(key: _Keys.idTeacher);
  }

  Future<String?> get statusUser => _secureStorage.read(key: _Keys.statusUser);

  Future<void> setUserStatus(int? id) {
    return _secureStorage.write(key: _Keys.statusUser, value: id.toString());
  }

  Future<void> deleteUserStatus() {
    return _secureStorage.delete(key: _Keys.statusUser);
  }

  Future<String?> avatarUserId(String avatarUserId) =>
      _secureStorage.read(key: avatarUserId);

  Future<void> setAvatarUser(String avatarUserId, String avatarUserPath) {
    return _secureStorage.write(key: avatarUserId, value: avatarUserPath);
  }

  Future<void> deleteAvatarUser(String avatarUserId) {
    return _secureStorage.delete(key: avatarUserId);
  }
}
