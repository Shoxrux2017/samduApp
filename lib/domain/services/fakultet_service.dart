import 'package:samduapp/domain/api_client/fakultet_api_client.dart';
import 'package:samduapp/domain/data_providers/session_data_provider.dart';
import 'package:samduapp/domain/entity/fakultet.dart';

import 'package:samduapp/domain/entity/fakultet_response.dart';

class FakultetService {
  final _sessionDataProvider = SessionDataProvider();
  final _fakultetApiClient = FakultetApiClient();

  Future<List<Fakultet>> loadFakultet() async {
    final token = await _sessionDataProvider.tokenUser;

    return await _fakultetApiClient.getFakultet(token);
  }
}
