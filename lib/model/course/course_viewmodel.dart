import 'package:edutiv/api/category_api.dart';
import 'package:edutiv/model/course/category_model.dart';
import 'package:edutiv/model/course/course_model.dart';
import 'package:flutter/material.dart';

import '../../api/course_api.dart';

class CourseViewModel extends ChangeNotifier {
  List<CategoryModel> _allCategory = [];
  List<CategoryModel> get allCategory => _allCategory;

  List<CourseModel> _allCourse = [];
  List<CourseModel> get allCourse => _allCourse;

  late CourseModel _courseData;
  CourseModel get courseData => _courseData;

  Future<List<CategoryModel>> getAllCategory() async {
    final categoryData = await CategoryAPI().fetchAllCategory();
    _allCategory = categoryData;
    notifyListeners();
    return allCategory;
  }

  Future<List<CourseModel>> getAllCourse() async {
    final courseData = await CourseAPI().fetchAllCourse();
    _allCourse = courseData;
    notifyListeners();
    return allCourse;
  }

  Future<CourseModel> getCourseById(int id) async {
    final course = await CourseAPI().fetchCourseById(id);
    _courseData = course;
    notifyListeners();
    return course;
  }

  // List<Section> _allSection = [];
  // List<Section> get allSection => _allSection;

  // List<Materials> _allMaterials = [];
  // List<Materials> get allMaterials => _allMaterials;

  // List<Tools> _allTools = [];
  // List<Tools> get allTools => _allTools;

  // List<Review> _allReview = [];
  // List<Review> get allReview => _allReview;

  // Future<List<Section>> getAllSectionFromCourseId(int id) async {
  //   final sectionData = await CourseAPI().getAllSectionFromCourseId(id);
  //   _allSection = sectionData;
  //   notifyListeners();
  //   return allSection;
  // }

  // Future<List<Materials>> getAllMaterialsFromSectionId(
  //     int courseId, int sectionId) async {
  //   final materialsData =
  //       await CourseAPI().getAllMaterialsFromSectionId(courseId, sectionId);
  //   _allMaterials = materialsData;
  //   notifyListeners();
  //   return allMaterials;
  // }

  // Future<List<Tools>> getAllToolsFromCourseId(int courseId) async {
  //   final toolsData = await CourseAPI().getAllToolsFromCourseId(courseId);
  //   _allTools = toolsData;
  //   notifyListeners();
  //   return allTools;
  // }

  // Future<List<Review>> getAllReviewFromCourseId(int courseId) async {
  //   final reviewData = await CourseAPI().getAllReviewFromCourseId(courseId);
  //   _allReview = reviewData;
  //   notifyListeners();
  //   return allReview;
  // }
}
