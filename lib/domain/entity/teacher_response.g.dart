// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeacherResponse _$TeacherResponseFromJson(Map<String, dynamic> json) =>
    TeacherResponse(
      teacher: (json['teacher'] as List<dynamic>)
          .map((e) => Teacher.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TeacherResponseToJson(TeacherResponse instance) =>
    <String, dynamic>{
      'teacher': instance.teacher.map((e) => e.toJson()).toList(),
    };
