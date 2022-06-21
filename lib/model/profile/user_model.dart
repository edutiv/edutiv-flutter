import 'package:edutiv/model/course/course_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../wishlist/wishlist_model.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  int id;
  String? avatar;
  String? firstname;
  String? lastname;
  String? email;
  String? password;
  String? role;
  String? specialization;
  // List<WishlistModel>? wishlist;
  // List<CourseModel>? enrolledCourse;
  // List<Review>? reviews;

  UserModel({
    required this.id,
    this.avatar,
    this.firstname,
    this.lastname,
    this.email,
    this.password,
    this.role,
    this.specialization,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
