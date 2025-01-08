import 'package:json_annotation/json_annotation.dart';

part 'cover_image_response.g.dart';

@JsonSerializable()
class CoverImageResponse {
  final String id;
  final int size;
  final String mimeType;
  final String extension;
  final String filename;
  final DateTime updatedAt;
  final DateTime createdAt;
  final String fileUrl;

  CoverImageResponse({
    required this.id,
    required this.size,
    required this.mimeType,
    required this.extension,
    required this.filename,
    required this.updatedAt,
    required this.createdAt,
    required this.fileUrl,
  });

  factory CoverImageResponse.fromJson(Map<String, dynamic> json) =>
      _$CoverImageResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CoverImageResponseToJson(this);
}
