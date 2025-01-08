import 'package:json_annotation/json_annotation.dart';

part 'book.g.dart';

@JsonSerializable(explicitToJson: true)
class Book {
  final String id;
  @JsonKey(name: 'book_Title')
  final String? bookTitle;

  final String? publisher;
  @JsonKey(name: 'publish_Date')
  final int? publishDate;
  final String? imageUrl;
  bool isFavorite;

  Book(
      {required this.id,
      required this.bookTitle,
      required this.publisher,
      required this.publishDate,
      required this.imageUrl,
      required this.isFavorite});

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
  Map<String, dynamic> toJson(Map<String, dynamic> e) => _$BookToJson(this);
}
