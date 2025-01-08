import 'package:flutter/material.dart';
import 'package:samduapp/domain/entity/oquv_uslubiy_ish_response.dart';
import 'package:samduapp/domain/services/oquv_uslubiy_ish_service.dart';
import 'package:samduapp/ui/navigation/main_navigation.dart';

class OquvUslubiyIshlarViewModel extends ChangeNotifier {
  OquvUslubiyIshlarViewModel() {
    initAsync();
  }

  final _oquvUslubiyIshService = OquvUslubiyIshService();

  final searchingQueryTextConroller = TextEditingController();

  final List<String> _filterQuery = [];

  final List<dynamic> _resultList = [];
  List<dynamic> get resultList => _resultList;

  bool _showHelpfulPage = false;

  bool get showHelpfulPage => _showHelpfulPage;

  String? _uslubiyNashrNomi;
  String? get uslubiyNashrNomi => _uslubiyNashrNomi;

  String? _uslubiyNashrTuri;
  String? get uslubiyNashrTuri => _uslubiyNashrTuri;

  List<String> _uslubiyNashrTurlari = [];
  List<String> get uslubiyNashrTurlari => _uslubiyNashrTurlari;

  String? _uslubiyNashrTili;
  String? get uslubiyNashrTili => _uslubiyNashrTili;

  List<String> _uslubiyNashrTillari = [];
  List<String> get uslubiyNashrTillari => _uslubiyNashrTillari;

  String? _uslubiyNashrYili;
  String? get uslubiyNashrYili => _uslubiyNashrYili;

  List<String> _uslubiyNashrYillari = [];
  List<String> get uslubiyNashrYillari => _uslubiyNashrYillari;

  String? _uslubiyNashrOquvYili;
  String? get uslubiyNashrOquvYili => _uslubiyNashrOquvYili;

  List<String> _uslubiyNashrOquvYillari = [];
  List<String> get uslubiyNashrOquvYillari => _uslubiyNashrOquvYillari;

  Future<void> initAsync() async {
    await _resetList();
    await _getItems();
  }

  Future<void> _getItems() async {
    _uslubiyNashrTurlari = await _oquvUslubiyIshService.getUslubiyNashrTuri();
    _uslubiyNashrTillari = await _oquvUslubiyIshService.getUslubiyNashrTili();
    _uslubiyNashrYillari = await _oquvUslubiyIshService.getUslubiyNashrYili();
    _uslubiyNashrOquvYillari =
        await _oquvUslubiyIshService.getUslubiyNashrOquvYili();
    notifyListeners();
  }

  void uslubiyNashrTuriDropDownCallback(String? selectedValue) {
    if (selectedValue is String) {
      // _categoryScienceItem = selectedValue;
      if (_filterQuery.contains(_uslubiyNashrTuri)) {
        _filterQuery.remove(_uslubiyNashrTuri);
        _filterQuery.add(selectedValue);
        _uslubiyNashrTuri = selectedValue;
        notifyListeners();
      } else {
        _filterQuery.add(selectedValue);
        _uslubiyNashrTuri = selectedValue;
        notifyListeners();
      }
    }
  }

  void uslubiyNashrTiliDropDownCallback(selectedValue) {
    if (_filterQuery.contains(_uslubiyNashrTili)) {
      _filterQuery.remove(_uslubiyNashrTili);
      _filterQuery.add(selectedValue);
      _uslubiyNashrTili = selectedValue;
      notifyListeners();
    } else {
      _filterQuery.add(selectedValue);
      _uslubiyNashrTili = selectedValue;
      notifyListeners();
    }
  }

  void uslubiyNashrYiliDropDownCallback(selectedValue) {
    if (_filterQuery.contains(_uslubiyNashrYili)) {
      _filterQuery.remove(_uslubiyNashrYili);
      _filterQuery.add(selectedValue);
      _uslubiyNashrYili = selectedValue;
      notifyListeners();
    } else {
      _filterQuery.add(selectedValue);
      _uslubiyNashrYili = selectedValue;
      notifyListeners();
    }
  }

  void uslubiyNashrOquvYiliDropDownCallback(selectedValue) {
    if (_filterQuery.contains(_uslubiyNashrOquvYili)) {
      _filterQuery.remove(_uslubiyNashrOquvYili);
      _filterQuery.add(selectedValue);
      _uslubiyNashrOquvYili = selectedValue;
      notifyListeners();
    } else {
      _filterQuery.add(selectedValue);
      _uslubiyNashrOquvYili = selectedValue;
      notifyListeners();
    }
  }

  void onMovieTap(BuildContext context) {
    Navigator.of(context).pushNamed(
      MainNavigationRouteNames.oquvUslubiyIshlarYaratish,
    );
  }

  Future<List<OquvUslubiyIshResponse>?> _downloadScienceWork() async {
    final query = searchingQueryTextConroller.text;
    if (query == '' && _filterQuery.isEmpty) {
      return await _oquvUslubiyIshService.downloadOquvUslubiyIsh();
    } else {
      return await _oquvUslubiyIshService.searchOquvUslubiyIsh(
          query, _filterQuery);
    }
  }

  Future<void> onChangedCase(query) async {
    if (query.isEmpty) {
      await _resetList();
      // await _sortingScienceWorks();
    }
  }

  Future<void> searchFilter() async {
    await _resetList();
    // await _sortingScienceWorks();
    _showHelpfulPage = !_showHelpfulPage;

    notifyListeners();
  }

  Future<void> _resetList() async {
    // _currentPage = 0;
    // _totalPage = 1;
    await _loadPage();
    notifyListeners();
  }

  Future<void> _loadPage() async {
    final scienceWorksResponse = await _downloadScienceWork();
    if (scienceWorksResponse != null) {
      _resultList.clear();
      _resultList.addAll(scienceWorksResponse);
      print(scienceWorksResponse[0].filePath);
      print('_resultList[0].filePath');
    } else {
      _resultList.add("Natija topilmadi");
    }

    notifyListeners();
  }

  Future<void> searchScienceWorks() async {
    final searchQuery = searchingQueryTextConroller.text;
    if (searchQuery.isEmpty && _filterQuery.isEmpty) return;

    // _resultList.clear();

    await _resetList();
    // await _sortingScienceWorks();
    notifyListeners();
  }

  Future<void> closeOrOpenFilterWindow() async {
    _showHelpfulPage = !_showHelpfulPage;

    notifyListeners();
  }

  Future<void> resetFilter() async {
    _uslubiyNashrTuri = null;
    _uslubiyNashrTili = null;
    _uslubiyNashrYili = null;
    _uslubiyNashrOquvYili = null;
    _filterQuery.clear();

    notifyListeners();
  }
}
