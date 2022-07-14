// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reports_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportsModel _$ReportsModelFromJson(Map<String, dynamic> json) => ReportsModel(
      id: json['id'] as int?,
      isCompleted: json['isCompleted'] as bool?,
      material: json['material'] == null
          ? null
          : Materials.fromJson(json['material'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReportsModelToJson(ReportsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isCompleted': instance.isCompleted,
      'material': instance.material,
    };
