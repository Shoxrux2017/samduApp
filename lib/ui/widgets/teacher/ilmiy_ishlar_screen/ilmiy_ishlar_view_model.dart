import 'package:flutter/material.dart';
import 'package:samduapp/domain/entity/ilmiy_ish_response.dart';
import 'package:samduapp/domain/services/ilmiy_ish_service.dart';
import 'package:samduapp/ui/navigation/main_navigation.dart';

class IlmiyIshlarViewModel extends ChangeNotifier {
  IlmiyIshlarViewModel() {
    initAsync();
  }

  final searchingQueryTextConroller = TextEditingController();

  bool _showHelpfulPage = false;

  bool get showHelpfulPage => _showHelpfulPage;

  final _ilmiyIshService = IlmiyIshService();

  // final List<String> _scienceTitle = [
  //   'Maqola',
  //   'Patent',
  //   'Monografiya',
  //   'Kashfiyotlar',
  //   'Grantlar',
  //   'Tezis'
  // ];
  final List<String> _filterQuery = [];
  final List<String> _sortingQuery = [];

  final List<dynamic> _resultList = [];
  List<dynamic> get resultList => _resultList;

  String? _publishLanguageItem;
  String? _publishTypeItem;
  String? _publishLevelItem;
  String? _studyYearItem;

  String? get publishLanguageItem => _publishLanguageItem;
  String? get publishTypeItem => _publishTypeItem;
  String? get publishLevelItem => _publishLevelItem;
  String? get studyYearItem => _studyYearItem;

  final _scienceWorks = <IlmiyIshResponse>[];
  String? _categoryScienceItem;

  String? get categoryScienceItem => _categoryScienceItem;
  List<IlmiyIshResponse> get scienceWorks => _scienceWorks;

  List<String> _categoryScienceItems = [];
  List<String> get categoryScienceItems => _categoryScienceItems;

  List<String> _publishTypeItems = [];
  List<String> get publishTypeItems => _publishTypeItems;

  List<String> _publishLanguageItems = [];
  List<String> get publishLanguageItems => _publishLanguageItems;

  List<String> _studyYearItems = [];
  List<String> get studyYearItems => _studyYearItems;

  List<String> _publishLevelItems = [];
  List<String> get publishLevelItems => _publishLevelItems;

  String? _scienceWorkYear;

  String? get scienceWorkYear => _scienceWorkYear;

  List<String> _scienceWorksYear = [];

  List<String> get scienceWorksYear => _scienceWorksYear;

  String? _scienceWorkPage;

  String? get scienceWorkPage => _scienceWorkPage;

  List<String> _scienceWorksPage = [];

  List<String> get scienceWorksPage => _scienceWorksPage;

  String? _scienceWorkAuthorCount;

  String? get scienceWorkAuthorCount => _scienceWorkAuthorCount;

  List<String> _scienceWorksAuthorCount = [];

  List<String> get scienceWorksAuthorCount => _scienceWorksAuthorCount;

  Future<void> initAsync() async {
    await _resetList();
    await _getItems();
    await _sortingScienceWorks();
  }

  Future<void> _getItems() async {
    _categoryScienceItems = await _ilmiyIshService.getScienceCategory();
    _publishTypeItems = await _ilmiyIshService.getPublishType();
    _publishLevelItems = await _ilmiyIshService.getPublishLevel();
    _publishLanguageItems = await _ilmiyIshService.getPublishLanguage();
    _studyYearItems = await _ilmiyIshService.getStudyYear();
    notifyListeners();
  }

  Future<void> _sortingScienceWorks() async {
    List<String> year = [];
    List<String> page = [];
    List<String> authorCount = [];

    for (var element in _scienceWorks) {
      year.add(element.year.toString());
      page.add(element.page.toString());
      authorCount.add(element.authorCount.toString());
    }
    Set<String> yearSet = year.toSet();
    _scienceWorksYear = yearSet.toList();

    Set<String> pageSet = page.toSet();
    _scienceWorksPage = pageSet.toList();

    Set<String> authorCountSet = authorCount.toSet();
    _scienceWorksAuthorCount = authorCountSet.toList();

    notifyListeners();
  }

  void sortingYearDropDownCallback(String? selectedValue) {
    if (selectedValue is String) {
      if (_sortingQuery.contains(_scienceWorkYear)) {
        _sortingQuery.remove(_scienceWorkYear);
        _sortingQuery.add(selectedValue);
        _scienceWorkYear = selectedValue;
        notifyListeners();
      } else {
        _sortingQuery.add(selectedValue);
        _scienceWorkYear = selectedValue;
        notifyListeners();
      }
    }
  }

  void sortingPageDropDownCallback(String? selectedValue) {
    if (selectedValue is String) {
      if (_sortingQuery.contains(_scienceWorkPage)) {
        _sortingQuery.remove(_scienceWorkPage);
        _sortingQuery.add(selectedValue);
        _scienceWorkPage = selectedValue;
        notifyListeners();
      } else {
        _sortingQuery.add(selectedValue);
        _scienceWorkPage = selectedValue;
        notifyListeners();
      }
    }
  }

  void sortingAuthorCountDropDownCallback(String? selectedValue) {
    if (selectedValue is String) {
      if (_sortingQuery.contains(_scienceWorkAuthorCount)) {
        _sortingQuery.remove(_scienceWorkAuthorCount);
        _sortingQuery.add(selectedValue);
        _scienceWorkAuthorCount = selectedValue;
        notifyListeners();
      } else {
        _sortingQuery.add(selectedValue);
        _scienceWorkAuthorCount = selectedValue;
        notifyListeners();
      }
    }
  }

  void categoryScienceDropDownCallback(String? selectedValue) {
    if (selectedValue is String) {
      // _categoryScienceItem = selectedValue;
      if (_filterQuery.contains(_categoryScienceItem)) {
        _filterQuery.remove(_categoryScienceItem);
        _filterQuery.add(selectedValue);
        _categoryScienceItem = selectedValue;
        notifyListeners();
      } else {
        _filterQuery.add(selectedValue);
        _categoryScienceItem = selectedValue;
        notifyListeners();
      }
    }
  }

  void publishTyperadioCallback(selectedValue) {
    if (_filterQuery.contains(_publishTypeItem)) {
      _filterQuery.remove(_publishTypeItem);
      _filterQuery.add(selectedValue);
      _publishTypeItem = selectedValue;
      notifyListeners();
    } else {
      _filterQuery.add(selectedValue);
      _publishTypeItem = selectedValue;
      notifyListeners();
    }
  }

  void publishLevelDropDownCallback(String? selectedValue) {
    if (selectedValue is String) {
      if (_filterQuery.contains(_publishLevelItem)) {
        _filterQuery.remove(_publishLevelItem);
        _filterQuery.add(selectedValue);
        _publishLevelItem = selectedValue;
        notifyListeners();
      } else {
        _filterQuery.add(selectedValue);
        _publishLevelItem = selectedValue;
        notifyListeners();
      }
    }
  }

  void publishLanguageDropDownCallback(String? selectedValue) {
    if (selectedValue is String) {
      if (_filterQuery.contains(_publishLanguageItem)) {
        _filterQuery.remove(_publishLanguageItem);
        _filterQuery.add(selectedValue);
        _publishLanguageItem = selectedValue;
        notifyListeners();
      } else {
        _filterQuery.add(selectedValue);
        _publishLanguageItem = selectedValue;
        notifyListeners();
      }
    }
  }

  void studyYearDropDownCallback(String? selectedValue) {
    if (selectedValue is String) {
      if (_filterQuery.contains(_studyYearItem)) {
        _filterQuery.remove(_studyYearItem);
        _filterQuery.add(selectedValue);
        _studyYearItem = selectedValue;
        notifyListeners();
      } else {
        _filterQuery.add(selectedValue);
        _studyYearItem = selectedValue;
        notifyListeners();
      }
    }
  }

  // List<String> _scienceTitle = [];
  // List<String> get scienceTitle => _scienceTitle;

  // Future<void> getItems() async {
  //   _scienceTitle = await _ilmiyIshService.getScienceCategory();

  //   notifyListeners();
  // }

  void onMovieTap(BuildContext context) {
    Navigator.of(context).pushNamed(
      MainNavigationRouteNames.ilmiyIshlarYaratish,
    );
  }

  // void onIlmiyIshlarDetails(BuildContext context, index) {
  //   final String ilmiyIshlarCategory = _scienceTitle[index];
  //   Navigator.of(context).pushNamed(
  //     MainNavigationRouteNames.ilmiyIshlarDetails,
  //     arguments: ilmiyIshlarCategory,
  //   );
  // }

  Future<void> _resetList() async {
    // _currentPage = 0;
    // _totalPage = 1;
    await _loadPage();
    notifyListeners();
  }

  Future<List<IlmiyIshResponse>?> _downloadScienceWork() async {
    final query = searchingQueryTextConroller.text;
    if (query == '' && _filterQuery.isEmpty && _sortingQuery.isEmpty) {
      return await _ilmiyIshService.downloadIlmiyIsh();
    } else {
      return await _ilmiyIshService.searchIlmiyIsh(
          query, _filterQuery, _sortingQuery);
    }
  }

  Future<void> _loadPage() async {
    final scienceWorksResponse = await _downloadScienceWork();
    if (scienceWorksResponse != null) {
      _resultList.clear();
      _resultList.addAll(scienceWorksResponse);
      _scienceWorks.addAll(scienceWorksResponse);
    } else {
      _resultList.add("Natija topilmadi");
    }

    notifyListeners();
  }

  Future<void> resetFilter() async {
    _categoryScienceItem = null;
    _publishTypeItem = null;
    _publishLevelItem = null;
    _publishLanguageItem = null;
    _studyYearItem = null;
    _scienceWorkYear = null;
    _scienceWorkAuthorCount = null;
    _scienceWorkPage = null;
    _sortingQuery.clear();
    _filterQuery.clear();

    notifyListeners();
  }

  Future<void> closeOrOpenFilterWindow() async {
    _showHelpfulPage = !_showHelpfulPage;

    notifyListeners();
    //   if (_filterQuery == []) return;
    //   await _resetList();
    //   notifyListeners();
    // _filteredWorks.clear();
    // for (var scienceWork in _scienceWorks) {
    //   var map = scienceWork.toJson().values.toList();

    //   bool ok = false;
    //   for (var q in _filterQuery) {
    //     if (map.contains(q)) {
    //       ok = true;
    //     } else {
    //       ok = false;
    //       break;
    //     }
    //   }
    //   if (ok) {
    //     _filteredWorks.add(scienceWork);
    //   }
    // }
    // _filterQuery.clear();
    // _showHelpfulPage = !_showHelpfulPage;
    // notifyListeners();
  }

  Future<void> searchFilter() async {
    await _resetList();
    await _sortingScienceWorks();
    _showHelpfulPage = !_showHelpfulPage;

    notifyListeners();
  }

  Future<void> searchScienceWorks() async {
    final searchQuery = searchingQueryTextConroller.text;
    if (searchQuery.isEmpty && _filterQuery.isEmpty) return;

    // _resultList.clear();

    await _resetList();
    await _sortingScienceWorks();
    notifyListeners();

    //   final searchQuery = text.isNotEmpty ? text : null;
    // if (searchQuery == null) return;
    // // if (_searchQuery == _searchQuery) return;
    // _searchQuery = searchQuery;
    // _resultList.clear();

    // await _resetList();
    // notifyListeners();

    // if (_searchQuery.isNotEmpty) {
    //   _resultList.clear();
    //   _scienceWorks.clear();
    //   await downloadScienceWork();
    //   for (var scienceWork in _scienceWorks) {
    //     var map = scienceWork.toJson().values.toList();
    //     for (var element in map) {
    //       element = element.toString();
    //       if (element.toLowerCase().contains(query.toLowerCase())) {
    //         _resultList.add(scienceWork);
    //         break;
    //       }
    //     }
    //   }
    // } else {
    //   _resultList = _scienceWorks;
    // }
    // notifyListeners();
  }

  Future<void> onChangedCase(query) async {
    if (query.isEmpty) {
      await _resetList();
      await _sortingScienceWorks();
    }
  }
}
