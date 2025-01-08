import 'package:json_annotation/json_annotation.dart';

part 'fakultet.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Fakultet {
  final int id;
  final String title;
  @JsonKey(fromJson: _parceDateFromString)
  final DateTime? createdAt;
  @JsonKey(fromJson: _parceDateFromString)
  final DateTime? updatedAt;

  Fakultet({
    required this.id,
    required this.title,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Fakultet.fromJson(Map<String, dynamic> json) =>
      _$FakultetFromJson(json);
  Map<String, dynamic> toJson() => _$FakultetToJson(this);

  static DateTime? _parceDateFromString(String? rawDate) {
    if (rawDate == null || rawDate.isEmpty) return null;
    return DateTime.tryParse(rawDate);
  }
}
