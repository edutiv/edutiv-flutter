// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tools_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tools _$ToolsFromJson(Map<String, dynamic> json) => Tools(
      id: json['id'] as int,
      toolsName: json['tool_name'] as String?,
      toolsIcon: json['tool_icon'] as String?,
      url: json['tool_url'] as String?,
    );

Map<String, dynamic> _$ToolsToJson(Tools instance) => <String, dynamic>{
      'id': instance.id,
      'tool_name': instance.toolsName,
      'tool_icon': instance.toolsIcon,
      'tool_url': instance.url,
    };
