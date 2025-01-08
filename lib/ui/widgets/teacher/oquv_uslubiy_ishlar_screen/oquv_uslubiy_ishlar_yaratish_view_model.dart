import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:samduapp/domain/services/oquv_uslubiy_ish_service.dart';
import 'package:samduapp/ui/navigation/main_navigation.dart';

class OquvUslubiyIshlarYaratishViewModel extends ChangeNotifier {
  final _oquvUslubiyIshService = OquvUslubiyIshService();

  String? _uslubiyNashrTuriItem;

  String? _uslubiyNashrTiliItem;
  String? _nashrYiliItem;
  String? _oquvYiliItem;

  String? get uslubiyNashrTuriItem => _uslubiyNashrTuriItem;

  String? get uslubiyNashrTiliItem => _uslubiyNashrTiliItem;
  String? get nashrYiliItem => _nashrYiliItem;
  String? get oquvYiliItem => _oquvYiliItem;

  final uslubiyNashrNomiTextConroller = TextEditingController();
  final uslubiyIshNashriyotiTextConroller = TextEditingController();
  final uslubiyIshMualliflariTextConroller = TextEditingController();
  final uslubiyIshMualliflarSoniTextConroller = TextEditingController();
  final uslubiyIshNashrParametrlariTextConroller = TextEditingController();
  final uslubiyIshGuvohnomaRaqamiTextConroller = TextEditingController();
  final uslubiyIshGuvohnomaSanasiTextConroller = TextEditingController();

  OquvUslubiyIshlarYaratishViewModel() {
    initAsync();
  }
  List<String> _uslubiyNashrTuriItems = [];
  List<String> get uslubiyNashrTuriItems => _uslubiyNashrTuriItems;

  List<String> _uslubiyNashrTiliItems = [];
  List<String> get uslubiyNashrTiliItems => _uslubiyNashrTiliItems;

  List<String> _oquvYiliItems = [];
  List<String> get oquvYiliItems => _oquvYiliItems;

  List<String> _nashrYiliItems = [];
  List<String> get nashrYiliItems => _nashrYiliItems;

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
    _uslubiyNashrTuriItems = await _oquvUslubiyIshService.getUslubiyNashrTuri();
    _uslubiyNashrTiliItems = await _oquvUslubiyIshService.getUslubiyNashrTili();
    _nashrYiliItems = await _oquvUslubiyIshService.getUslubiyNashrYili();
    _oquvYiliItems = await _oquvUslubiyIshService.getUslubiyNashrOquvYili();
    notifyListeners();
  }

  void uslubiyNashrTuriDropDownCallback(String? selectedValue) {
    if (selectedValue is String) {
      _uslubiyNashrTuriItem = selectedValue;
      notifyListeners();
    }
  }

  void uslubiyNashrTiliDropDownCallback(selectedValue) {
    _uslubiyNashrTiliItem = selectedValue;

    notifyListeners();
  }

  void uslubiyNashrYiliDropDownCallback(String? selectedValue) {
    if (selectedValue is String) {
      _nashrYiliItem = selectedValue;
      notifyListeners();
    }
  }

  void uslubiyNashrOquvYiliDropDownCallback(String? selectedValue) {
    if (selectedValue is String) {
      _oquvYiliItem = selectedValue;
      notifyListeners();
    }
  }

  Future<void> uploadIlmiyIsh(BuildContext context) async {
    final nomi = uslubiyNashrNomiTextConroller.text;
    final nashriyoti = uslubiyIshNashriyotiTextConroller.text;
    final mualliflari = uslubiyIshMualliflariTextConroller.text;
    final mualliflarSoni = uslubiyIshMualliflarSoniTextConroller.text;
    final nashrParametrlari = uslubiyIshNashrParametrlariTextConroller.text;
    final guvohnomaRaqami = uslubiyIshGuvohnomaRaqamiTextConroller.text;
    final guvohnomaSanasi = uslubiyIshGuvohnomaSanasiTextConroller.text;

    try {
      if (_platformFile == null) {
        _platformFileEror = true;
        notifyListeners();
      }
      FormState formState = Form.of(context);
      if (formState.validate()) {
        await _oquvUslubiyIshService.uploadIlmiyIsh(
          _file,
          guvohnomaRaqami,
          nashriyoti,
          nomi: nomi,
          mualliflari: mualliflari,
          mualliflarSoni: mualliflarSoni,
          nashrParametrlari: nashrParametrlari,
          guvohnomaSanasi: guvohnomaSanasi,
          //from drop down
          uslubiyNashrTuri: _uslubiyNashrTuriItem!,
          uslubiyNashrTili: _uslubiyNashrTiliItem!,
          uslubiyNashrYili: _nashrYiliItem!,
          uslubiyNashrOquvYili: _oquvYiliItem!,
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
    } catch (e) {}
  }
}
