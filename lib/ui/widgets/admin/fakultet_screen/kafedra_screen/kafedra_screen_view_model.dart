import 'package:flutter/material.dart';

import 'package:samduapp/domain/entity/kafedra.dart';
import 'package:samduapp/domain/services/kafedra_service.dart';

import 'package:samduapp/ui/navigation/main_navigation.dart';

class KafedraScreenViewModel extends ChangeNotifier {
  final int fakultetId;
  final _kafedraService = KafedraService();

  final _kafedraList = <Kafedra>[];

  List<Kafedra> get kafedraList => _kafedraList;

  KafedraScreenViewModel(this.fakultetId);

  Future<void> getKafedraAll(BuildContext context) async {
    final kafedraResponse = await _kafedraService.loadKafedra(fakultetId);
    _kafedraList.addAll(kafedraResponse);
    notifyListeners();
  }

  Future<void> onKafedraTap(BuildContext context, index) async {
    final id = _kafedraList[index].id;
    Navigator.of(context).pushNamed(
      MainNavigationRouteNames.teacherScreen,
      arguments: id,
    );
  }
}
