import 'package:samduapp/domain/api_client/kafedra_api_client.dart';
import 'package:samduapp/domain/data_providers/session_data_provider.dart';
import 'package:samduapp/domain/entity/kafedra.dart';

class KafedraService {
  final _sessionDataProvider = SessionDataProvider();
  final _kafedraApiClient = KafedraApiClient();

  Future<List<Kafedra>> loadKafedra(int fakultetId) async {
    final token = await _sessionDataProvider.tokenUser;

    return await _kafedraApiClient.getFakultet(token, fakultetId);
  }
}
