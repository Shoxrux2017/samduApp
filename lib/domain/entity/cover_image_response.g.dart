// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cover_image_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoverImageResponse _$CoverImageResponseFromJson(Map<String, dynamic> json) =>
    CoverImageResponse(
      id: json['id'] as String,
      size: json['size'] as int,
      mimeType: json['mimeType'] as String,
      extension: json['extension'] as String,
      filename: json['filename'] as String,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      fileUrl: json['fileUrl'] as String,
    );

Map<String, dynamic> _$CoverImageResponseToJson(CoverImageResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'size': instance.size,
      'mimeType': instance.mimeType,
      'extension': instance.extension,
      'filename': instance.filename,
      'updatedAt': instance.updatedAt.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'fileUrl': instance.fileUrl,
    };
