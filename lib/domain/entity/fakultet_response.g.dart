// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fakultet_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FakultetResponse _$FakultetResponseFromJson(Map<String, dynamic> json) =>
    FakultetResponse(
      fakultet: (json['fakultet'] as List<dynamic>)
          .map((e) => Fakultet.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FakultetResponseToJson(FakultetResponse instance) =>
    <String, dynamic>{
      'fakultet': instance.fakultet.map((e) => e.toJson()).toList(),
    };
