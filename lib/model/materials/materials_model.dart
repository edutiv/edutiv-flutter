import 'package:json_annotation/json_annotation.dart';

import '../section/section_model.dart';
part 'materials_model.g.dart';

@JsonSerializable()
class Materials {
  int id;
  Section? section;
  @JsonKey(name: 'material_type')
  String? materialType;
  @JsonKey(name: 'material_name')
  String? materialName;
  @JsonKey(name: 'material_url')
  String? url;
  @JsonKey(name: 'is_completed')
  bool? isCompleted;

  Materials({
    required this.id,
    this.section,
    this.materialType,
    this.materialName,
    this.url,
    this.isCompleted,
  });

  factory Materials.fromJson(Map<String, dynamic> json) => _$MaterialsFromJson(json);
  Map<String, dynamic> toJson() => _$MaterialsToJson(this);
}