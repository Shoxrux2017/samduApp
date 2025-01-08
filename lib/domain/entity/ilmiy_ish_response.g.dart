// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ilmiy_ish_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IlmiyIshResponse _$IlmiyIshResponseFromJson(Map<String, dynamic> json) =>
    IlmiyIshResponse(
      id: json['id'] as int,
      userId: json['user_id'] as int,
      scienceCategory: json['science_category_title'] as String,
      publishType: json['publish_type_title'] as String,
      publishLevel: json['publish_level_title'] as String,
      publishLanguage: json['publish_language_title'] as String,
      studYear: json['study_year_title'] as String,
      title: json['title'] as String,
      publish: json['publish'] as String,
      year: json['year'] as int,
      page: json['page'] as int,
      author: json['author'] as String,
      coAuthor: json['coAuthor'] as String?,
      authorCount: json['authorCount'] as int,
      doi: json['doi'] as String?,
      filePath: json['file_path'] as String?,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$IlmiyIshResponseToJson(IlmiyIshResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'science_category_title': instance.scienceCategory,
      'publish_type_title': instance.publishType,
      'publish_level_title': instance.publishLevel,
      'publish_language_title': instance.publishLanguage,
      'study_year_title': instance.studYear,
      'title': instance.title,
      'publish': instance.publish,
      'year': instance.year,
      'page': instance.page,
      'author': instance.author,
      'coAuthor': instance.coAuthor,
      'authorCount': instance.authorCount,
      'doi': instance.doi,
      'file_path': instance.filePath,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
