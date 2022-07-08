// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      id: json['id'] as int,
      categoryName: json['category_name'] as String?,
      categoryImage: json['category_image'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category_name': instance.categoryName,
      'category_image': instance.categoryImage,
      'description': instance.description,
    };
