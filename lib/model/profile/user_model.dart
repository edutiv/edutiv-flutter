import 'package:edutiv/model/course/course_model.dart';

import '../wishlist/wishlist_model.dart';

class UserModel {
  int id;
  String firstName;
  String lastName;
  String avatar;
  String specialization;
  String email;
  String password;
  List<WishlistModel>? wishlist;
  List<CourseModel>? enrolledCourse;
  String? role;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.avatar,
    required this.specialization,
    required this.email,
    required this.password,
    this.role,
    this.wishlist,
    this.enrolledCourse,
  });
}
