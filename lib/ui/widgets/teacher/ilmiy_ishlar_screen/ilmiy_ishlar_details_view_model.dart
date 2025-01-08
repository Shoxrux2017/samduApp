import 'package:flutter/material.dart';
import 'package:samduapp/domain/entity/ilmiy_ish_response.dart';
import 'package:samduapp/domain/services/ilmiy_ish_service.dart';

class IlmiyIshlarDetailsViewModel extends ChangeNotifier {
  final String scienceTitle;

  final _ilmiyIshService = IlmiyIshService();

  final _scienceWorks = <IlmiyIshResponse>[];

  List<IlmiyIshResponse> get scienceWorks => _scienceWorks;

  IlmiyIshlarDetailsViewModel(this.scienceTitle) {
    // initAsync();
  }

  // Future<void> initAsync() async {
  //   await downloadScienceWork();
  // }

  // Future<void> downloadScienceWork() async {
  //   final scienceWorksResponse = await _ilmiyIshService
  //       .downloadIlmiyIshByCategory(category: scienceTitle);
  //   if (scienceWorksResponse != null) {
  //     _scienceWorks.addAll(scienceWorksResponse);

  //     notifyListeners();
  //   }
  // }
}
