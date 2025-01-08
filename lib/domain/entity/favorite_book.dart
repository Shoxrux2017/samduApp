import 'package:json_annotation/json_annotation.dart';
part 'favorite_book.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class FavoriteBook {
  final int id;

  final int userId;

  final String bookId;

  final String? bookDescription;

  final String? bookTitle;

  final String? imageUrl;
  final int? publishDate;
  final String? publisher;
  final int isFav;

  FavoriteBook({
    required this.id,
    required this.userId,
    required this.bookId,
    required this.bookDescription,
    required this.bookTitle,
    required this.imageUrl,
    required this.publishDate,
    required this.publisher,
    required this.isFav,
  });

  factory FavoriteBook.fromJson(Map<String, dynamic> json) =>
      _$FavoriteBookFromJson(json);
  Map<String, dynamic> toJson(Map<String, dynamic> e) =>
      _$FavoriteBookToJson(this);
}
