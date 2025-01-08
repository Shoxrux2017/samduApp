import 'package:json_annotation/json_annotation.dart';
import 'package:samduapp/domain/entity/data_parser.dart';

part 'oquv_uslubiy_ish_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class OquvUslubiyIshResponse {
  int id;

  // @JsonKey(name: 'user_id')
  int userId;

  // @JsonKey(name: 'uslubiy_nashr_turi')
  String uslubiyNashrTuri;

  // @JsonKey(name: 'uslubiy_nashr_tili')
  String uslubiyNashrTili;

  // @JsonKey(name: 'uslubiy_nashr_nomi')
  String uslubiyNashrNomi;

  // @JsonKey(name: 'mualliflar_soni')
  String mualliflarSoni;

  String mualliflar;
  String? nashriyot;

  // @JsonKey(name: 'nashr_parametrlari')
  String nashrParametrlari;

  // @JsonKey(name: 'nashr_yili')
  String nashrYili;

  // @JsonKey(name: 'guvohnoma_raqami')
  String? guvohnomaRaqami;
  @JsonKey(fromJson: parseDateFromString)
  // @JsonKey(name: 'guvohnoma_sanasi')
  final DateTime? guvohnomaSanasi;

  // @JsonKey(name: 'oquv_yili')
  String oquvYili;

  String? filePath;

  OquvUslubiyIshResponse({
    required this.id,
    required this.userId,
    required this.uslubiyNashrTuri, // 1
    required this.uslubiyNashrTili, // 2
    required this.uslubiyNashrNomi,
    required this.mualliflarSoni,
    required this.mualliflar,
    required this.nashriyot,
    required this.nashrParametrlari,
    required this.nashrYili, // 3
    required this.guvohnomaRaqami,
    required this.guvohnomaSanasi,
    required this.oquvYili, // 4
    required this.filePath,
  });

  factory OquvUslubiyIshResponse.fromJson(Map<String, dynamic> json) =>
      _$OquvUslubiyIshResponseFromJson(json);
  Map<String, dynamic> toJson() => _$OquvUslubiyIshResponseToJson(this);
}
