import 'package:edutiv/model/course/course_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'tools_model.g.dart';

@JsonSerializable()
class Tools {
  int id;
  CourseModel courseId;
  String? toolsName;
  String? toolsIcon;
  String? url;

  Tools({
    required this.id,
    required this.courseId,
    this.toolsName,
    this.toolsIcon,
    this.url,
  });

  factory Tools.fromJson(Map<String, dynamic> json) => _$ToolsFromJson(json);
  Map<String, dynamic> toJson() => _$ToolsToJson(this);
}
