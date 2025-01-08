import 'package:json_annotation/json_annotation.dart';
import 'package:samduapp/domain/entity/kafedra.dart';

part 'kafedra_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class KafedraResponse {
  final List<Kafedra> kafedra;

  KafedraResponse({required this.kafedra});

  factory KafedraResponse.fromJson(Map<String, dynamic> json) =>
      _$KafedraResponseFromJson(json);
  Map<String, dynamic> toJson() => _$KafedraResponseToJson(this);
}
