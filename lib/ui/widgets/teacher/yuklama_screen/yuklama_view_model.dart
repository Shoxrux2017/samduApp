import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:samduapp/domain/services/auth_services.dart';
import 'package:samduapp/domain/services/file_service.dart';
import 'package:samduapp/ui/navigation/main_navigation.dart';
import 'package:url_launcher/url_launcher.dart';

class YuklamaViewModelFileTitle {
  final String namunaviyTitle = 'namunaviy';
  final String sillabusTitle = 'sillabus';
  final String yuklamaTitle = 'yuklama';
}

class YuklamaViewModel extends ChangeNotifier {
  final _fileService = FileService();
  final _authService = AuthService();
  final categoryFile = YuklamaViewModelFileTitle();

  bool _stateNamunaviy = false;
  bool get stateNamunaviy => _stateNamunaviy;
  bool get stateNamunaviyButton => !_stateNamunaviy;

  bool _stateSillabus = false;
  bool get stateSillabus => _stateSillabus;
  bool get stateSillabusButton => !_stateSillabus;

  bool _stateYuklama = false;
  bool get stateYuklama => _stateYuklama;
  bool get stateYuklamaButton => !_stateYuklama;

  String _status = '';
  String get status => _status;

  String? _fileUrlYuklama;
  String? _fileUrlNamunaviy;
  String? _fileUrlSillabus;

  YuklamaViewModel();

  Future<void> initAsync() async {
    await checkingFile();
    await checkingStatus();
  }

  Future<void> refreshInfo() async {
    await checkingFile();
  }

  Future<void> checkingStatus() async {
    final status = await _authService.checkingStatus();
    if (status == '1') {
      _status = 'admin';
      notifyListeners();
    } else if (status == '2') {
      _status = 'teacher';
      notifyListeners();
    }
  }

  Future<void> checkingFile() async {
    await checkingYuklama();
    await checkingNamunaviy();
    await checkingSillabus();
  }

  Future<void> downloadYuklama() async {
    try {
      await _fileService.downloadYuklama(
          categoryFile: categoryFile.yuklamaTitle);
    } catch (e) {
      // print(e);
    }
  }

  Future<void> onMovieTapYuklama(BuildContext context) async {
    if (_fileUrlYuklama != null) {
      // final url = Uri.parse(_fileUrlYuklama!);

      Navigator.of(context).pushNamed(
        MainNavigationRouteNames.pdfScreen,
        arguments: _fileUrlYuklama,
      );

      // await launchUrl(url);
    } else {
      // Show a Snackbar if the URL cannot be launched
      final snackBar = SnackBar(
        content: const Text('Fayl Mavjud emas!'),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Yopish',
          onPressed: () {},
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Future<void> checkingYuklama() async {
    try {
      final resultCheck = await _fileService.checkingFile(
          categoryFile: categoryFile.yuklamaTitle);
      if (resultCheck != null) {
        _fileUrlYuklama = resultCheck;

        _stateYuklama = true;
        notifyListeners();
      } else {
        _stateYuklama = false;
        notifyListeners();
      }
    } catch (e) {
      _stateYuklama = false;
      notifyListeners();
    }
  }

  Future<void> pickNamunaviyFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      final filePath = result.files.single.path;
      final file = File(filePath!);

      await _uploadNamunaviy(file);
      checkingFile();
    }
  }

  Future<void> onMovieTapNamunaviy(BuildContext context) async {
    if (_fileUrlNamunaviy != null) {
      final Uri url = Uri.parse(_fileUrlNamunaviy!);
      await launchUrl(url);
    } else {
      // Show a Snackbar if the URL cannot be launched
      final snackBar = SnackBar(
        content: const Text('Fayl mavjud emas!'),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Yopish',
          onPressed: () {},
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Future<void> _uploadNamunaviy(File file) async {
    try {
      await _fileService.uploadFile(
          file: file, categoryFile: categoryFile.namunaviyTitle);
      _stateNamunaviy = true;
      notifyListeners();
    } catch (e) {
      // print(e);
    }
  }

  Future<void> checkingNamunaviy() async {
    try {
      final resultCheck = await _fileService.checkingFile(
          categoryFile: categoryFile.namunaviyTitle);
      if (resultCheck != null) {
        _fileUrlNamunaviy = resultCheck;

        _stateNamunaviy = true;
        notifyListeners();
      } else {
        _stateNamunaviy = false;
        notifyListeners();
      }
    } catch (e) {
      _stateNamunaviy = false;
      notifyListeners();
    }
  }

  Future<void> deleteNamunaviy() async {
    try {
      final resultCheck = await _fileService.deleteFile(
          categoryFile: categoryFile.namunaviyTitle);
      if (resultCheck == true) {
        _stateNamunaviy = false;
        _fileUrlNamunaviy = null;
        notifyListeners();
      }
    } catch (e) {
      // print(e);
    }
  }

  Future<void> onMovieTapSillabus(BuildContext context) async {
    if (_fileUrlSillabus != null) {
      final Uri url = Uri.parse(_fileUrlSillabus!);
      !await launchUrl(url);
    } else {
      // Show a Snackbar if the URL cannot be launched
      final snackBar = SnackBar(
        content: const Text('Fayl mavjud emas!'),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Yopish',
          onPressed: () {},
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Future<void> pickSillabusFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      final filePath = result.files.single.path;
      final file = File(filePath!);

      await _uploadSillabus(file);
      checkingFile();
    }
  }

  Future<void> _uploadSillabus(File file) async {
    try {
      await _fileService.uploadFile(
          file: file, categoryFile: categoryFile.sillabusTitle);
      _stateSillabus = true;
      notifyListeners();
    } catch (e) {
      // print(e);
    }
  }

  Future<void> checkingSillabus() async {
    try {
      final resultCheck = await _fileService.checkingFile(
          categoryFile: categoryFile.sillabusTitle);
      if (resultCheck != null) {
        _fileUrlSillabus = resultCheck;

        _stateSillabus = true;
        notifyListeners();
      } else {
        _stateSillabus = false;
        notifyListeners();
      }
    } catch (e) {
      _stateSillabus = false;
      notifyListeners();
    }
  }

  Future<void> deleteSillabus() async {
    try {
      await _fileService.deleteFile(categoryFile: categoryFile.sillabusTitle);
      _stateSillabus = false;
      _fileUrlSillabus = null;
      checkingFile();
      notifyListeners();
    } catch (e) {
      // print(e);
    }
  }

  void goToScreenAdabiyotlarRuyxatiYaratish(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MainNavigationRouteNames.adabiyotlarRuyxatiYaratishScreen);
  }

  void goToScreenAdabiyotlarRuyxatiKurish(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MainNavigationRouteNames.adabiyotlarRuyxatiKurishScreen);
  }
}
