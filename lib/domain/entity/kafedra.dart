import 'package:json_annotation/json_annotation.dart';

part 'kafedra.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Kafedra {
  int id;
  int fakultetId;
  String title;

  Kafedra(
    this.id,
    this.title,
    this.fakultetId,
  );

  factory Kafedra.fromJson(Map<String, dynamic> json) =>
      _$KafedraFromJson(json);
  Map<String, dynamic> toJson() => _$KafedraToJson(this);
}
