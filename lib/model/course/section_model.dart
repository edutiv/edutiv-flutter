import 'package:edutiv/model/course/course_model.dart';
import 'package:edutiv/model/course/materials_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'section_model.g.dart';

@JsonSerializable()
class Section {
  int id;
  CourseModel? course;
  @JsonKey(name: 'section_name')
  String? sectionName;
  List<Materials>? materials;

  Section({
    required this.id,
    this.course,
    this.sectionName,
    this.materials
  });

  factory Section.fromJson(Map<String, dynamic> json) =>
      _$SectionFromJson(json);
  Map<String, dynamic> toJson() => _$SectionToJson(this);
}
