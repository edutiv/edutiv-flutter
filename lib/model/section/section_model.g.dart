// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'section_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Section _$SectionFromJson(Map<String, dynamic> json) => Section(
      id: json['id'] as int,
      course: json['course'] == null
          ? null
          : CourseModel.fromJson(json['course'] as Map<String, dynamic>),
      sectionName: json['section_name'] as String?,
      materials: (json['materials'] as List<dynamic>?)
          ?.map((e) => Materials.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SectionToJson(Section instance) => <String, dynamic>{
      'id': instance.id,
      'course': instance.course,
      'section_name': instance.sectionName,
      'materials': instance.materials,
    };
