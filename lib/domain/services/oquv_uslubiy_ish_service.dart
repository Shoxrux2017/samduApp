import 'package:samduapp/domain/api_client/oquv_uslubiy_ish_api_client.dart';
import 'package:samduapp/domain/data_providers/session_data_provider.dart';
import 'package:samduapp/domain/entity/oquv_uslubiy_ish_response.dart';

class OquvUslubiyIshService {
  final _sessionDataProvider = SessionDataProvider();
  final _oquvUslubiyIshApiClient = OquvUslubiyIshApiClient();

  Future<void> uploadIlmiyIsh(
    file,
    guvohnomaRaqami,
    nashriyoti, {
    required String nomi,
    required String mualliflari,
    required String mualliflarSoni,
    required String nashrParametrlari,
    required String guvohnomaSanasi,
    //from drop down
    required String uslubiyNashrTuri,
    required String uslubiyNashrTili,
    required String uslubiyNashrYili,
    required String uslubiyNashrOquvYili,
  }) async {
    final getToken = await _sessionDataProvider.tokenUser;
    final userIdString = await _sessionDataProvider.idUser;
    if (userIdString == null || getToken == null) return;
    final userId = int.parse(userIdString);
    await _oquvUslubiyIshApiClient.uploadIlmiyIsh(
      file,
      guvohnomaRaqami,
      nashriyoti,
      uslubiyNashrNomi: nomi,
      mualliflari: mualliflari,
      mualliflarSoni: mualliflarSoni,
      nashrParametrlari: nashrParametrlari,
      guvohnomaSanasi: guvohnomaSanasi,
      //from drop down
      uslubiyNashrTuri: uslubiyNashrTuri,
      uslubiyNashrTili: uslubiyNashrTili,
      uslubiyNashrYili: uslubiyNashrYili,
      uslubiyNashrOquvYili: uslubiyNashrOquvYili,
      userId: userId,
      token: getToken,
    );
  }

  Future<List<OquvUslubiyIshResponse>?> downloadOquvUslubiyIsh() async {
    final getToken = await _sessionDataProvider.tokenUser;
    final userIdString = await _sessionDataProvider.idUser;

    if (userIdString == null || getToken == null) return null;
    final teacherId = await _sessionDataProvider.idTeacher;
    final id = int.parse(teacherId!);
    return await _oquvUslubiyIshApiClient.downloadOquvUslubiyIsh(
        id: id, token: getToken);
  }

  Future<List<OquvUslubiyIshResponse>?> searchOquvUslubiyIsh(
      query, filteredQuery) async {
    final getToken = await _sessionDataProvider.tokenUser;
    final userIdString = await _sessionDataProvider.idUser;

    if (userIdString == null || getToken == null) return null;
    final teacherId = await _sessionDataProvider.idTeacher;
    final id = int.parse(teacherId!);

    return await _oquvUslubiyIshApiClient
        .searchOquvUslubiyIsh(query, filteredQuery, id: id, token: getToken);
  }

  Future<List<String>> getUslubiyNashrTuri() async {
    final getToken = await _sessionDataProvider.tokenUser;

    return await _oquvUslubiyIshApiClient.getUslubiyNashrTuri(getToken);
  }

  Future<List<String>> getUslubiyNashrTili() async {
    final getToken = await _sessionDataProvider.tokenUser;

    return await _oquvUslubiyIshApiClient.getNashrTili(getToken);
  }

  Future<List<String>> getUslubiyNashrYili() async {
    final getToken = await _sessionDataProvider.tokenUser;

    return await _oquvUslubiyIshApiClient.getNashrYili(getToken);
  }

  Future<List<String>> getUslubiyNashrOquvYili() async {
    final getToken = await _sessionDataProvider.tokenUser;

    return await _oquvUslubiyIshApiClient.getOquvYili(getToken);
  }
}
