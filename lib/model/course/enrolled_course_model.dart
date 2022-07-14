import 'package:edutiv/model/course/reports_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:edutiv/model/course/course_model.dart';
import 'package:edutiv/model/profile/user_model.dart';
part 'enrolled_course_model.g.dart';

@JsonSerializable()
class EnrolledCourseModel {
  int? id;
  double? rating;
  double? progress;
  String? review;
  UserModel? user;
  CourseModel? course;
  List<ReportsModel>? reports;

  EnrolledCourseModel({
    this.id,
    this.rating,
    this.progress,
    this.review,
    this.user,
    this.course,
    this.reports,
  });

  factory EnrolledCourseModel.fromJson(Map<String, dynamic> json) =>
      _$EnrolledCourseModelFromJson(json);
  Map<String, dynamic> toJson() => _$EnrolledCourseModelToJson(this);
}
