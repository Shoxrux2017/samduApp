import 'package:flutter/material.dart';

import 'package:samduapp/domain/entity/favorite_book.dart';
import 'package:samduapp/domain/services/file_service.dart';
import 'package:url_launcher/url_launcher.dart';

class AdabiyotlarRuyxatiKurishViewModel extends ChangeNotifier {
  final _fileService = FileService();

  var _books = const <FavoriteBook>[];

  AdabiyotlarRuyxatiKurishViewModel();

  List<FavoriteBook> get books => _books;

  var _filteredBooks = <FavoriteBook>[];

  List<FavoriteBook> get filteredBooks => _filteredBooks;

  Future<void> initAsync() async {
    getFavourite();
    _filteredBooks = _books;
  }

  Future<void> getFavourite() async {
    final favBooks = await _fileService.getFavorite();

    if (favBooks != null) {
      _books = favBooks;
      _filteredBooks = _books;
      notifyListeners();
    }
  }

  Future<void> onMovieTap(int index) async {
    final id = _books[index].bookId;
    final bookUrl = await _fileService.openBook(id);
    if (bookUrl != null) {
      final Uri url = Uri.parse(bookUrl);
      if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
      }
    }
  }

  void searchBooks(query) async {
    if (query.isNotEmpty) {
      _filteredBooks = _books.where((FavoriteBook book) {
        final res = book.bookTitle;
        if (res != null) {
          return res.toLowerCase().contains(query.toLowerCase());
        }
        return false;
      }).toList();
    } else {
      _filteredBooks = _books;
    }
    notifyListeners();
  }
}
