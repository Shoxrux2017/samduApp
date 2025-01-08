import 'package:samduapp/domain/api_client/teacher_api_client.dart';
import 'package:samduapp/domain/data_providers/session_data_provider.dart';
import 'package:samduapp/domain/entity/teacher_response.dart';

class TeacherService {
  final _sessionDataProvider = SessionDataProvider();
  final _teacherApiClient = TeacherApiClient();

  Future<TeacherResponse> loadTeacher(int kafedraId) async {
    final getToken = await _sessionDataProvider.tokenUser;
    return await _teacherApiClient.getTeacher(getToken, kafedraId);
  }

  Future<void> setTeacherId(int teacherId) async {
    await _sessionDataProvider.setTeacherId(teacherId);
  }
}
