// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'materials_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Materials _$MaterialsFromJson(Map<String, dynamic> json) => Materials(
      id: json['id'] as int,
      section: json['section'] == null
          ? null
          : Section.fromJson(json['section'] as Map<String, dynamic>),
      materialType: json['material_type'] as String?,
      materialName: json['material_name'] as String?,
      url: json['material_url'] as String?,
      isCompleted: json['is_completed'] as bool?,
    );

Map<String, dynamic> _$MaterialsToJson(Materials instance) => <String, dynamic>{
      'id': instance.id,
      'section': instance.section,
      'material_type': instance.materialType,
      'material_name': instance.materialName,
      'material_url': instance.url,
      'is_completed': instance.isCompleted,
    };
