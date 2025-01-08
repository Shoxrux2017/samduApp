// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oquv_uslubiy_ish_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OquvUslubiyIshResponse _$OquvUslubiyIshResponseFromJson(
        Map<String, dynamic> json) =>
    OquvUslubiyIshResponse(
      id: json['id'] as int,
      userId: json['user_id'] as int,
      uslubiyNashrTuri: json['uslubiy_nashr_turi'] as String,
      uslubiyNashrTili: json['uslubiy_nashr_tili'] as String,
      uslubiyNashrNomi: json['uslubiy_nashr_nomi'] as String,
      mualliflarSoni: json['mualliflar_soni'] as String,
      mualliflar: json['mualliflar'] as String,
      nashriyot: json['nashriyot'] as String?,
      nashrParametrlari: json['nashr_parametrlari'] as String,
      nashrYili: json['nashr_yili'] as String,
      guvohnomaRaqami: json['guvohnoma_raqami'] as String?,
      guvohnomaSanasi: parseDateFromString(json['guvohnoma_sanasi'] as String?),
      oquvYili: json['oquv_yili'] as String,
      filePath: json['file_path'] as String?,
    );

Map<String, dynamic> _$OquvUslubiyIshResponseToJson(
        OquvUslubiyIshResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'uslubiy_nashr_turi': instance.uslubiyNashrTuri,
      'uslubiy_nashr_tili': instance.uslubiyNashrTili,
      'uslubiy_nashr_nomi': instance.uslubiyNashrNomi,
      'mualliflar_soni': instance.mualliflarSoni,
      'mualliflar': instance.mualliflar,
      'nashriyot': instance.nashriyot,
      'nashr_parametrlari': instance.nashrParametrlari,
      'nashr_yili': instance.nashrYili,
      'guvohnoma_raqami': instance.guvohnomaRaqami,
      'guvohnoma_sanasi': instance.guvohnomaSanasi?.toIso8601String(),
      'oquv_yili': instance.oquvYili,
      'file_path': instance.filePath,
    };
