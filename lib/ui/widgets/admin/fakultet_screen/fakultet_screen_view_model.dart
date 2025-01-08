import 'package:flutter/material.dart';
import 'package:samduapp/domain/entity/fakultet.dart';

import 'package:samduapp/domain/services/fakultet_service.dart';

import 'package:samduapp/ui/navigation/main_navigation.dart';

class FakultetListRowData {
  final int id;
  final String title;

  FakultetListRowData({
    required this.id,
    required this.title,
  });
}

class FakultetScreenViewModel extends ChangeNotifier {
  final _fakultetService = FakultetService();
  final List<String> _images = [
    "assets/images/mathematics.png",
    "assets/images/biological.png",
    "assets/images/geography.png",
    "assets/images/history.png",
    "assets/images/psychology.png",
    "assets/images/chemistry.png",
    "assets/images/it.png",
    "assets/images/juridical.png",
    "assets/images/philology.png",
    "assets/images/preschool.png",
    "assets/images/sport.png",
    "assets/images/control.png",
  ];

  List<String> get images => _images;

  List<Fakultet> _fakultetList = [];

  List<Fakultet> get fakultetList => _fakultetList;

  Future<void> getFakultetAll(BuildContext context) async {
    final result = await _fakultetService.loadFakultet();
    _fakultetList.addAll(result);

    notifyListeners();
  }

  Future<void> onFakultetTap(BuildContext context, index) async {
    final id = _fakultetList[index].id;
    Navigator.of(context).pushNamed(
      MainNavigationRouteNames.kafedraScreen,
      arguments: id,
    );
  }
}
