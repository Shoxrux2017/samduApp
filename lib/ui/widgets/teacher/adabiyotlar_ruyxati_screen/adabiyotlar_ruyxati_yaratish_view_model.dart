import 'package:flutter/material.dart';
import 'package:samduapp/domain/entity/book.dart';
import 'package:samduapp/domain/services/file_service.dart';
import 'package:url_launcher/url_launcher.dart';

class AdabiyotlarRuyxatiYaratishViewModel extends ChangeNotifier {
  final _fileService = FileService();

  var _books = const <Book>[];

  AdabiyotlarRuyxatiYaratishViewModel();

  List<Book> get books => _books;

  Future<void> getFavourite() async {
    final favBooks = await _fileService.getFavorite();
    if (favBooks != null) {
      for (var book in _books) {
        for (var bookFromServer in favBooks) {
          if (book.id == bookFromServer.bookId) {
            book.isFavorite = true;
            notifyListeners();
          }
        }
      }
    }
  }

  Future<void> searchBooks(String query) async {
    if (query.length < 4) {
      if (_books.isNotEmpty) {
        _books.clear();
        notifyListeners();
      }
      return;
    }

    final result = await _fileService.searchBook(query);

    if (result != null) {
      _books = result;
      getFavourite();
      notifyListeners();
    }
  }

  void onMovieTap(int index) async {
    final id = _books[index].id;
    final bookUrl = await _fileService.openBook(id);
    if (bookUrl != null) {
      final Uri url = Uri.parse(bookUrl);
      if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
      }
    }
  }

  void toggleFavorite(int index) async {
    final id = _books[index].id;
    books[index].isFavorite = !books[index].isFavorite;
    final isFav = books[index].isFavorite;
    notifyListeners();
    await _fileService.doFavourite(id, isFav);
  }
}
