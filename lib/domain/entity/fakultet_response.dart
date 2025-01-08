import 'package:json_annotation/json_annotation.dart';
import 'package:samduapp/domain/entity/fakultet.dart';

part 'fakultet_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class FakultetResponse {
  final List<Fakultet> fakultet;

  FakultetResponse({required this.fakultet});

  factory FakultetResponse.fromJson(Map<String, dynamic> json) =>
      _$FakultetResponseFromJson(json);
  Map<String, dynamic> toJson() => _$FakultetResponseToJson(this);
}
