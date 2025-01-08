// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteBook _$FavoriteBookFromJson(Map<String, dynamic> json) => FavoriteBook(
      id: json['id'] as int,
      userId: json['user_id'] as int,
      bookId: json['book_id'] as String,
      bookDescription: json['book_description'] as String?,
      bookTitle: json['book_title'] as String?,
      imageUrl: json['image_url'] as String?,
      publishDate: json['publish_date'] as int?,
      publisher: json['publisher'] as String?,
      isFav: json['is_fav'] as int,
    );

Map<String, dynamic> _$FavoriteBookToJson(FavoriteBook instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'book_id': instance.bookId,
      'book_description': instance.bookDescription,
      'book_title': instance.bookTitle,
      'image_url': instance.imageUrl,
      'publish_date': instance.publishDate,
      'publisher': instance.publisher,
      'is_fav': instance.isFav,
    };
