import 'package:samduapp/domain/api_client/yuklama_api_client.dart';
import 'package:samduapp/domain/data_providers/session_data_provider.dart';
import 'package:samduapp/domain/entity/book.dart';
import 'package:samduapp/domain/entity/favorite_book.dart';

class FileService {
  final _sessionDataProvider = SessionDataProvider();
  final _yuklamaApiClient = YuklamaApiClient();

  Future<void> doFavourite(bookId, isFav) async {
    final getToken = await _sessionDataProvider.tokenUser;
    final userIdString = await _sessionDataProvider.idUser;
    if (userIdString == null || getToken == null) return;
    final userId = int.parse(userIdString);
    await _yuklamaApiClient.doFavourite(userId, bookId, getToken, isFav);
  }

  Future<List<FavoriteBook>?> getFavorite() async {
    final getToken = await _sessionDataProvider.tokenUser;
    final userIdString = await _sessionDataProvider.idUser;

    if (userIdString == null || getToken == null) return null;
    final teacherId = await _sessionDataProvider.idTeacher;
    print("Bu teacherId: $teacherId");
    final id = int.parse(teacherId!);
    final bookId = await _yuklamaApiClient.getFavorite(id, getToken);
    if (bookId != null) {
      return bookId;
    }
    return null;
  }

  Future<List<Book>?> searchBook(String query) async {
    final getToken = await _sessionDataProvider.tokenUser;
    if (getToken != null) {
      return _yuklamaApiClient.searchBook(getToken, query);
    }
    return null;
  }

  Future<String?> openBook(String id) async {
    final getToken = await _sessionDataProvider.tokenUser;
    if (getToken != null) {
      return _yuklamaApiClient.openBook(getToken, id);
    }
    return null;
  }

  Future<void> downloadYuklama({
    required String categoryFile,
  }) async {
    final getToken = await _sessionDataProvider.tokenUser;

    final userIdString = await _sessionDataProvider.idUser;

    if (userIdString == null || getToken == null) return;

    final teacherId = await _sessionDataProvider.idTeacher;
    print("Bu teacherId: $teacherId");
    final id = int.parse(teacherId!);

    await _yuklamaApiClient.downloadYuklama(id, categoryFile, getToken);
  }

  Future<void> uploadFile({
    required file,
    required String categoryFile,
  }) async {
    final getToken = await _sessionDataProvider.tokenUser;
    final userIdString = await _sessionDataProvider.idUser;
    if (userIdString == null || getToken == null) return;
    final userId = int.parse(userIdString);
    await _yuklamaApiClient.uploadFile(userId, categoryFile, getToken, file);
  }

  Future<String?> checkingFile({required String categoryFile}) async {
    final getToken = await _sessionDataProvider.tokenUser;
    final userIdString = await _sessionDataProvider.idUser;

    if (userIdString == null || getToken == null) return null;
    final teacherId = await _sessionDataProvider.idTeacher;
    print("Bu teacherId: $teacherId");
    final id = int.parse(teacherId!);
    final fileUrl =
        await _yuklamaApiClient.checkingFile(id, categoryFile, getToken);
    return fileUrl;
  }

  Future<bool?> deleteFile({
    required String categoryFile,
  }) async {
    final getToken = await _sessionDataProvider.tokenUser;
    final userIdString = await _sessionDataProvider.idUser;
    if (userIdString == null || getToken == null) return false;
    final userId = int.parse(userIdString);
    final res = await _yuklamaApiClient.deleteNamunaviyFile(
        userId, categoryFile, getToken);
    if (res != null) {
      return true;
    } else {
      return false;
    }
  }
}
