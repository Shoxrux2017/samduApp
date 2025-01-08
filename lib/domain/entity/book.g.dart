// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Book _$BookFromJson(Map<String, dynamic> json) => Book(
      id: json['id'] as String,
      bookTitle: json['book_Title'] as String?,
      publisher: json['publisher'] as String?,
      publishDate: json['publish_Date'] as int?,
      imageUrl: json['imageUrl'] as String?,
      isFavorite: false,
    );

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
      'id': instance.id,
      'book_Title': instance.bookTitle,
      'publisher': instance.publisher,
      'publish_Date': instance.publishDate,
      'imageUrl': instance.imageUrl,
      'isFavorite': instance.isFavorite,
    };
