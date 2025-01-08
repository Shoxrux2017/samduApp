import 'package:json_annotation/json_annotation.dart';

part 'ilmiy_ish_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class IlmiyIshResponse {
  int id;
  @JsonKey(name: 'user_id')
  int userId;
  @JsonKey(name: 'science_category_title')
  String scienceCategory;
  @JsonKey(name: 'publish_type_title')
  String publishType;
  @JsonKey(name: 'publish_level_title')
  String publishLevel;
  @JsonKey(name: 'publish_language_title')
  String publishLanguage;
  @JsonKey(name: 'study_year_title')
  String studYear;

  String title;
  String publish;
  int year;
  int page;
  String author;
  String? coAuthor;
  int authorCount;
  String? doi;
  @JsonKey(name: 'file_path')
  String? filePath;
  @JsonKey(name: 'created_at')
  String createdAt;
  @JsonKey(name: 'updated_at')
  String updatedAt;

  IlmiyIshResponse({
    required this.id,
    required this.userId,
    required this.scienceCategory,
    required this.publishType,
    required this.publishLevel,
    required this.publishLanguage,
    required this.studYear,
    required this.title,
    required this.publish,
    required this.year,
    required this.page,
    required this.author,
    required this.coAuthor,
    required this.authorCount,
    required this.doi,
    required this.filePath,
    required this.createdAt,
    required this.updatedAt,
  });

  factory IlmiyIshResponse.fromJson(Map<String, dynamic> json) =>
      _$IlmiyIshResponseFromJson(json);
  Map<String, dynamic> toJson() => _$IlmiyIshResponseToJson(this);
}
