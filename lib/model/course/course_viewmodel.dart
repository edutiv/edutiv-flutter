import 'package:edutiv/api/category_api.dart';
import 'package:edutiv/model/course/category_model.dart';
import 'package:edutiv/model/course/course_model.dart';
import 'package:edutiv/model/course/materials_model.dart';
import 'package:edutiv/model/course/section_model.dart';
import 'package:flutter/material.dart';

import '../../api/course_api.dart';

class CourseViewModel extends ChangeNotifier {
  List<CategoryModel> _allCategory = [];
  List<CategoryModel> get allCategory => _allCategory;

  List<CourseModel> _allCourse = [];
  List<CourseModel> get allCourse => _allCourse;

  List<Section> _allSection = [];
  List<Section> get allSection => _allSection;

  List<Materials> _allMaterials = [];
  List<Materials> get allMaterials => _allMaterials;

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

  Future<List<Section>> getAllSectionFromCourseId(int id) async {
    final sectionData = await CourseAPI().getAllSectionFromCourseId(id);
    _allSection = sectionData;
    notifyListeners();
    return allSection;
  }

  Future<List<Materials>> getAllMaterialsFromSectionId(
      int courseId, int sectionId) async {
    final materialsData =
        await CourseAPI().getAllMaterialsFromSectionId(courseId, sectionId);
    _allMaterials = materialsData;
    notifyListeners();
    return allMaterials;
  }
}
