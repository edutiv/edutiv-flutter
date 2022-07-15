import 'package:edutiv/api/category_api.dart';
import 'package:edutiv/model/course/course_model.dart';
import 'package:flutter/material.dart';

import '../../api/course_api.dart';
import '../category/category_model.dart';
import '../review/review_model.dart';

class CourseViewModel extends ChangeNotifier {
  bool isLoading = true;
  bool isLoading2 = true;

  List<CategoryModel> _allCategory = [];
  List<CategoryModel> get allCategory => _allCategory;

  List<CourseModel> _allCourse = [];
  List<CourseModel>? get allCourse => _allCourse;

  List<Review> _allReview = [];
  List<Review>? get allReview => _allReview;

  late CourseModel _courseData;
  CourseModel get courseData => _courseData;

  Future<List<CategoryModel>> getAllCategory() async {
    final categoryData = await CategoryAPI().fetchAllCategory();
    _allCategory = categoryData;
    isLoading = false;
    notifyListeners();
    return allCategory;
  }

  Future<List<CourseModel>>? getAllCourse() async {
    final courseData = await CourseAPI().fetchAllCourse();
    _allCourse = courseData;
    isLoading2 = false;
    notifyListeners();
    return allCourse ?? [];
  }

  Future<List<Review>>? getAllReviewByCourseId(int courseId) async {
    final listReview = await CourseAPI().fetchAllReviewFromCourseId(courseId);
    _allReview = listReview;
    // isLoading2 = false;
    notifyListeners();
    return listReview;
  }

  Future<CourseModel> getCourseById(int id) async {
    isLoading;
    final course = await CourseAPI().fetchCourseById(id);
    _courseData = course;
    isLoading = false;
    notifyListeners();
    return course;
  }

  Future<List<CourseModel>> searchCourseByName(String query) async {
    final data = await CourseAPI().searchCourseByName(query);
    _allCourse = data;
    if (query == '' || query.isEmpty) {
      getAllCourse();
      notifyListeners();
    }
    notifyListeners();
    return data;
  }

  Future<Review> createReview(
      int enrolledCourseId, int rating, String review) async {
    final reviewCourse =
        await CourseAPI().createReview(enrolledCourseId, rating, review);
    notifyListeners();
    return reviewCourse;
  }

  Future enrollCourse(int userId, int courseId) async {
    final enroll = await CourseAPI().enrollCourse(userId, courseId);
    notifyListeners();
    return enroll;
  }

  Future<List<CourseModel>> filterCourseByCategory(String query) async {
    final filter =
        _allCourse.where((e) => e.category?.categoryName == query).toList();
    _allCourse = filter;
    if (query == 'All') {
      getAllCourse();
      notifyListeners();
    } else if (query.isEmpty) {
      getAllCourse();
      notifyListeners();
    }
    notifyListeners();
    return filter;
  }

  // searchCourse(String query) {
  //   // var data = Provider.of<CourseViewModel>(context, listen: false);
  //   final suggestions = allCourse.where((c) {
  //     final courseTitle = c.courseName?.toLowerCase();
  //     final input = query.toLowerCase();
  //     return courseTitle!.contains(input);
  //   }).toList();
  //   _allCourse = suggestions;
  //   notifyListeners();
  //   // setState(() => data.allCourse == suggestions);
  // }

}
