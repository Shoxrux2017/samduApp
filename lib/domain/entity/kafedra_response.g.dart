// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kafedra_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KafedraResponse _$KafedraResponseFromJson(Map<String, dynamic> json) =>
    KafedraResponse(
      kafedra: (json['kafedra'] as List<dynamic>)
          .map((e) => Kafedra.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$KafedraResponseToJson(KafedraResponse instance) =>
    <String, dynamic>{
      'kafedra': instance.kafedra.map((e) => e.toJson()).toList(),
    };
