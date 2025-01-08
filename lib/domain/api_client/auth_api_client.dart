import 'package:samduapp/config/configuration.dart';
import 'package:samduapp/domain/api_client/network_client.dart';
import 'package:samduapp/domain/entity/user.dart';

class AccountApiClient {
  // Future<ApiResponse> login(String email, String password) async {
  //   ApiResponse apiResponse = ApiResponse();
  //   try {
  //     final response = await http.post(Uri.parse(loginURL),
  //         headers: {'Accept': 'application/json'},
  //         body: {'email': email, 'password': password});

  //     switch (response.statusCode) {
  //       case 200:
  //         apiResponse.data = User.fromJson(jsonDecode(response.body));
  //         break;
  //       case 422:
  //         final errors = jsonDecode(response.body)['errors'];
  //         apiResponse.error = errors[errors.keys.elementAt(0)][0];
  //         break;
  //       case 403:
  //         apiResponse.error = jsonDecode(response.body)['message'];
  //         break;
  //       default:
  //         apiResponse.error = somethingWentWrong;
  //         break;
  //     }
  //   } catch (e) {
  //     apiResponse.error = serverError;
  //   }

  //   return apiResponse;
  // }

  final _networkClient = NetworkClient();

  Future<User> loginUser({
    required String email,
    required String password,
  }) async {
    parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final user = User.fromJson(jsonMap);
      // jsonMap['token'] as String;
      return user;
    }

    final bodyParametrs = <String, dynamic>{
      'email': email,
      'password': password,
    };
    final result = _networkClient.post(loginURL, parser, bodyParametrs);
    return result;
  }

  Future<User> registrationUser({
    required String name,
    required String email,
    required String password,
  }) async {
    parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final token = User.fromJson(jsonMap);
      return token;
    }

    final bodyParametrs = <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': password
    };
    final result = _networkClient.post(registerURL, parser, bodyParametrs);
    return result;
  }
}
