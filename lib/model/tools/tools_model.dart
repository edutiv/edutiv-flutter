import 'package:edutiv/model/course/course_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'tools_model.g.dart';

@JsonSerializable()
class Tools {
  int id;
  @JsonKey(name: 'tool_name')
  String? toolsName;
  @JsonKey(name: 'tool_icon')
  String? toolsIcon;
  @JsonKey(name: 'tool_url')
  String? url;

  Tools({
    required this.id,
    this.toolsName,
    this.toolsIcon,
    this.url,
  });

  factory Tools.fromJson(Map<String, dynamic> json) => _$ToolsFromJson(json);
  Map<String, dynamic> toJson() => _$ToolsToJson(this);
}
