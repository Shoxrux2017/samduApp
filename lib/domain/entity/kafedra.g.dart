// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kafedra.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Kafedra _$KafedraFromJson(Map<String, dynamic> json) => Kafedra(
      json['id'] as int,
      json['title'] as String,
      json['fakultet_id'] as int,
    );

Map<String, dynamic> _$KafedraToJson(Kafedra instance) => <String, dynamic>{
      'id': instance.id,
      'fakultet_id': instance.fakultetId,
      'title': instance.title,
    };
