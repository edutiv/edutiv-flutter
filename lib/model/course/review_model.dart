import 'package:edutiv/model/course/course_model.dart';
import 'package:edutiv/model/profile/user_model.dart';

import 'package:json_annotation/json_annotation.dart';
part 'review_model.g.dart';

@JsonSerializable()
class Review {
  int id;
  int? rating;
  String? review;
  UserModel user;
  CourseModel course;

  Review({
    required this.id,
    required this.user,
    required this.course,
    this.rating,
    this.review,
  });

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}
