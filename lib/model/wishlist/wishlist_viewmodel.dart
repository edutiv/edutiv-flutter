import 'package:edutiv/model/course/course_model.dart';
import 'package:flutter/material.dart';

class WishlistViewModel extends ChangeNotifier {
  final List<CourseModel> _wishlishedCourse = [];

  List<CourseModel>? get wishlishedCourse => _wishlishedCourse;
}
