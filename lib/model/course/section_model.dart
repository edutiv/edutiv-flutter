import 'package:edutiv/model/course/course_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'section_model.g.dart';

@JsonSerializable()
class Section {
  int id;
  CourseModel? course;
  @JsonKey(name: 'section_name')
  String? sectionName;

  Section({
    required this.id,
    this.course,
    this.sectionName,
  });

  factory Section.fromJson(Map<String, dynamic> json) => _$SectionFromJson(json);
  Map<String, dynamic> toJson() => _$SectionToJson(this);
}
