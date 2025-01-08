import 'package:samduapp/domain/entity/teacher.dart';
import 'package:json_annotation/json_annotation.dart';

part 'teacher_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class TeacherResponse {
  final List<Teacher> teacher;

  TeacherResponse({required this.teacher});

  factory TeacherResponse.fromJson(Map<String, dynamic> json) =>
      _$TeacherResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TeacherResponseToJson(this);
}
