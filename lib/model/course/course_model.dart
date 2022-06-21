import 'package:edutiv/model/course/category_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'course_model.g.dart';

@JsonSerializable()
class CourseModel {
  int id;
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
  // int? rating;
  // String? mentorName;
  // List<Section>? section;
  // List<Tools>? tools;
  // List<Review>? reviews;

  CourseModel({
    required this.id,
    this.courseName,
    this.courseImage,
    this.category,
    this.description,
    this.totalVideo,
    this.totalTime,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) => _$CourseModelFromJson(json);
  Map<String, dynamic> toJson() => _$CourseModelToJson(this);
}