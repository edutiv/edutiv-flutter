// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tools_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tools _$ToolsFromJson(Map<String, dynamic> json) => Tools(
      id: json['id'] as int,
      courseId: CourseModel.fromJson(json['courseId'] as Map<String, dynamic>),
      toolsName: json['toolsName'] as String?,
      toolsIcon: json['toolsIcon'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$ToolsToJson(Tools instance) => <String, dynamic>{
      'id': instance.id,
      'courseId': instance.courseId,
      'toolsName': instance.toolsName,
      'toolsIcon': instance.toolsIcon,
      'url': instance.url,
    };
