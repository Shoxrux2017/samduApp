import 'package:samduapp/config/configuration.dart';
import 'package:samduapp/domain/api_client/network_client.dart';
import 'package:samduapp/domain/entity/teacher_response.dart';

class TeacherApiClient {
  final _networkClient = NetworkClient();

  Future<TeacherResponse> getTeacher(token, int kafedraId) async {
    parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = TeacherResponse.fromJson(jsonMap);
      return response;
    }

    final result = await _networkClient.get(
      token,
      '$teacherURL/$kafedraId',
      parser,
    );
    return result;
  }
}
