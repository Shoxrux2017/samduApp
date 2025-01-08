// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fakultet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Fakultet _$FakultetFromJson(Map<String, dynamic> json) => Fakultet(
      id: json['id'] as int,
      title: json['title'] as String,
      createdAt: Fakultet._parceDateFromString(json['created_at'] as String?),
      updatedAt: Fakultet._parceDateFromString(json['updated_at'] as String?),
    );

Map<String, dynamic> _$FakultetToJson(Fakultet instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
