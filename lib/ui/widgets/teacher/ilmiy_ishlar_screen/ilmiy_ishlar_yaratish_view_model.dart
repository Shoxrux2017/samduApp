import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:samduapp/domain/services/ilmiy_ish_service.dart';
import 'package:samduapp/ui/navigation/main_navigation.dart';

class IlmiyIshlarYaratishViewModel extends ChangeNotifier {
  final _ilmiyIshService = IlmiyIshService();

  String? _categoryScienceItem;

  String? _publishLanguageItem;
  String? _publishTypeItem;
  String? _publishLevelItem;
  String? _studyYearItem;

  String? get categoryScienceItem => _categoryScienceItem;

  String? get publishLanguageItem => _publishLanguageItem;
  String? get publishTypeItem => _publishTypeItem;
  String? get publishLevelItem => _publishLevelItem;
  String? get studyYearItem => _studyYearItem;

  final nameTextConroller = TextEditingController();
  final publishTextConroller = TextEditingController();
  final yearTextConroller = TextEditingController();
  final pageTextConroller = TextEditingController();
  final authorTextConroller = TextEditingController();
  final coAuthorTextConroller = TextEditingController();
  final authorCountTextConroller = TextEditingController();
  final doiTextConroller = TextEditingController();

  IlmiyIshlarYaratishViewModel() {
    initAsync();
  }
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

  File? _file;
  bool _platformFileEror = false;

  bool get platformFileEror => _platformFileEror;

  PlatformFile? _platformFile;

  PlatformFile? get platformFile => _platformFile;
  get file => _file;

  Future<void> selectFile() async {
    final file = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['png', 'jpg', 'jpeg', 'pdf']);

    if (file != null) {
      _file = File(file.files.single.path!);
      _platformFile = file.files.first;
      notifyListeners();
    }
    if (_platformFile != null) {
      _platformFileEror = false;
      notifyListeners();
    }
  }

  Future<void> initAsync() async {
    await getItems();
  }

  Future<void> getItems() async {
    _categoryScienceItems = await _ilmiyIshService.getScienceCategory();
    _publishTypeItems = await _ilmiyIshService.getPublishType();
    _publishLevelItems = await _ilmiyIshService.getPublishLevel();
    _publishLanguageItems = await _ilmiyIshService.getPublishLanguage();
    _studyYearItems = await _ilmiyIshService.getStudyYear();
    notifyListeners();
  }

  void categoryScienceDropDownCallback(String? selectedValue) {
    if (selectedValue is String) {
      _categoryScienceItem = selectedValue;
      notifyListeners();
    }
  }

  void publishTyperadioCallback(selectedValue) {
    _publishTypeItem = selectedValue;
    print(_publishTypeItem);
    notifyListeners();
  }

  void publishLevelDropDownCallback(String? selectedValue) {
    if (selectedValue is String) {
      _publishLevelItem = selectedValue;
      notifyListeners();
    }
  }

  void publishLanguageDropDownCallback(String? selectedValue) {
    if (selectedValue is String) {
      _publishLanguageItem = selectedValue;
      notifyListeners();
    }
  }

  void studyYearDropDownCallback(String? selectedValue) {
    if (selectedValue is String) {
      _studyYearItem = selectedValue;
      notifyListeners();
    }
  }

  Future<void> uploadIlmiyIsh(BuildContext context) async {
    final title = nameTextConroller.text;
    final publish = publishTextConroller.text;
    final year = yearTextConroller.text;
    final page = pageTextConroller.text;
    final author = authorTextConroller.text;
    final coAuthor = coAuthorTextConroller.text;
    final authorCount = authorCountTextConroller.text;
    final doi = doiTextConroller.text;

    try {
      if (_platformFile == null) {
        _platformFileEror = true;
        notifyListeners();
      }
      FormState formState = Form.of(context);
      if (formState.validate()) {
        await _ilmiyIshService.uploadIlmiyIsh(
          _file,
          doi,
          coAuthor,
          title: title,
          publish: publish,
          year: int.parse(year),
          page: int.parse(page),
          author: author,
          authorCount: int.parse(authorCount),
          category: _categoryScienceItem!,
          publishType: _publishTypeItem!,
          publishLevel: _publishLevelItem!,
          publishLanguage: _publishLanguageItem!,
          studyYear: _studyYearItem!,
        );

        Navigator.of(context).pushNamedAndRemoveUntil(
            MainNavigationRouteNames.mainTeacherScreen, (route) => false);
      } else {
        final snackBar = SnackBar(
          content: const Text('Formada xatolik mavjud!!!'),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              // Some code to undo the change.
            },
          ),
        );

        // Find the ScaffoldMessenger in the widget tree
        // and use it to show a SnackBar.
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      print('object1');
    }
  }
}
