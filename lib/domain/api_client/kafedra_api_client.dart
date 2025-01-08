import 'package:samduapp/config/configuration.dart';
import 'package:samduapp/domain/api_client/network_client.dart';
import 'package:samduapp/domain/entity/kafedra.dart';
import 'package:samduapp/domain/entity/kafedra_response.dart';

class KafedraApiClient {
  final _networkClient = NetworkClient();

  Future<List<Kafedra>> getFakultet(token, int fakultetId) async {
    parser(dynamic json) {
      List<Kafedra> response = [];
      for (var element in json) {
        final jsonMap = element as Map<String, dynamic>;
        response.add(Kafedra.fromJson(jsonMap));
      }
      // final result = json
      //     .map((dynamic e) => Fakultet.fromJson(e as Map<String, dynamic>))
      //     .toList();

      return response;
    }

    final result = await _networkClient.getWithoutKey(
      token,
      '$kafedraURL/$fakultetId',
      parser,
    );
    return result;
  }
}
