import 'package:json_annotation/json_annotation.dart';
import 'package:edutiv/model/materials/materials_model.dart';
part 'reports_model.g.dart';

@JsonSerializable()
class ReportsModel {
  int? id;
  @JsonKey(name: 'is_completed')
  bool? isCompleted;
  Materials? material;

  ReportsModel({
    this.id,
    this.isCompleted,
    this.material,
  });

  factory ReportsModel.fromJson(Map<String, dynamic> json) =>
      _$ReportsModelFromJson(json);
  Map<String, dynamic> toJson() => _$ReportsModelToJson(this);
}
