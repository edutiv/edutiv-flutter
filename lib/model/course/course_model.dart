import 'package:json_annotation/json_annotation.dart';

import '../category/category_model.dart';
import '../review/review_model.dart';
import '../section/section_model.dart';
import '../tools/tools_model.dart';
part 'course_model.g.dart';

@JsonSerializable()
class CourseModel {
  int? id;
  @JsonKey(name: 'course_name')
  String? courseName;
  @JsonKey(name: 'course_image')
  String? courseImage;
  CategoryModel? category;
  String? description;
  @JsonKey(name: 'total_video')
  int? totalVideo;
  @JsonKey(name: 'total_times')
  String? totalTime;
  List<Section>? sections;
  List<Review>? reviews;
  List<Tools>? tools;

  CourseModel({
    this.id,
    this.courseName,
    this.courseImage,
    this.category,
    this.description,
    this.totalVideo,
    this.totalTime,
    this.sections,
    this.reviews,
    this.tools,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) =>
      _$CourseModelFromJson(json);
  Map<String, dynamic> toJson() => _$CourseModelToJson(this);
}
