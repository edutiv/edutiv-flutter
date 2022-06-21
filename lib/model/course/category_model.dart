import 'package:json_annotation/json_annotation.dart';
part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  int id;
  @JsonKey(name: 'category_name')
  String? categoryName;
  @JsonKey(name: 'category_image')
  String? categoryImage;
  String? description;

  CategoryModel({
    required this.id,
    this.categoryName,
    this.categoryImage,
    this.description,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
