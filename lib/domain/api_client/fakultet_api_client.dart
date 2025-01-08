import 'package:samduapp/config/configuration.dart';
import 'package:samduapp/domain/api_client/network_client.dart';
import 'package:samduapp/domain/entity/fakultet.dart';
import 'package:samduapp/domain/entity/kafedra.dart';

class FakultetApiClient {
  final _networkClient = NetworkClient();

  Future<List<Fakultet>> getFakultet(token) async {
    parser(dynamic json) {
      List<Fakultet> response = [];
      for (var element in json) {
        final jsonMap = element as Map<String, dynamic>;
        response.add(Fakultet.fromJson(jsonMap));
      }
      // final result = json
      //     .map((dynamic e) => Fakultet.fromJson(e as Map<String, dynamic>))
      //     .toList();

      return response;
    }

    final result =
        await (_networkClient.getWithoutKey(token, fakultetURL, parser));

    return result;

    // try {
    //   final request = await _client.getUrl(Uri.parse(fakultetURL));
    //   request.headers.add('Authorization', 'Bearer $token');

    //   final response = await request.close();

    //   if (response.statusCode == 200) {
    //     final String responseBody =
    //         await response.transform(utf8.decoder).join();
    //     return jsonDecode(responseBody);
    //   } else {
    //     // If the server did not return a 200 OK response, throw an exception.
    //     throw Exception('Failed to load fakultet');
    //   }
    // } catch (e) {
    //   // Handle any exceptions that occurred during the request
    //   throw Exception('Failed to connect to the server: $e');
    // }
  }
}
