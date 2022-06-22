import 'package:dio/dio.dart';
import 'package:edutiv/model/course/course_model.dart';
import 'package:edutiv/model/course/materials_model.dart';
import 'package:edutiv/model/course/review_model.dart';
import 'package:edutiv/model/course/section_model.dart';
import 'package:edutiv/model/course/tools_model.dart';

class CourseAPI {
  Dio dio = Dio(
    BaseOptions(baseUrl: 'https://edutiv-springboot.herokuapp.com/'),
  );

  Future<List<CourseModel>> fetchAllCourse() async {
    Response response =
        await Dio().get('https://edutiv-springboot.herokuapp.com/course');

    if (response.statusCode == 200) {
      List<CourseModel> course = (response.data['data'] as List)
          .map((e) => CourseModel.fromJson(e))
          .toList();
      return course;
    } else {
      throw Exception('No Course Available.');
    }
  }

  Future<List<Section>> getAllSectionFromCourseId(int id) async {
    Response response = await Dio()
        .get('https://edutiv-springboot.herokuapp.com/course/$id/section');

    if (response.statusCode == 200) {
      List<Section> allSection = (response.data['data'] as List)
          .map((e) => Section.fromJson(e))
          .toList();
      return allSection;
    } else {
      throw Exception('No Section Available');
    }
  }

  Future<List<Materials>> getAllMaterialsFromSectionId(
      int courseId, int sectionId) async {
    Response response = await Dio().get(
        'https://edutiv-springboot.herokuapp.com/course/$courseId/section/$sectionId/material');

    if (response.statusCode == 200) {
      List<Materials> allMaterials = (response.data['data'] as List)
          .map((e) => Materials.fromJson(e))
          .toList();
      return allMaterials;
    } else {
      throw Exception('No Materials Available');
    }
  }

  Future<List<Tools>> getAllToolsFromCourseId(int courseId) async {
    Response response = await Dio()
        .get('https://edutiv-springboot.herokuapp.com/course/$courseId/tool');

    if (response.statusCode == 200) {
      List<Tools> allTools = (response.data['data'] as List)
          .map((e) => Tools.fromJson(e))
          .toList();
      return allTools;
    } else {
      throw Exception('No Tools Available');
    }
  }

  Future<List<Review>> getAllReviewFromCourseId(int courseId) async {
    Response response = await Dio()
        .get('https://edutiv-springboot.herokuapp.com/course/$courseId/review');

    if (response.statusCode == 200) {
      List<Review> allReview = (response.data['data'] as List)
          .map((e) => Review.fromJson(e))
          .toList();
      return allReview;
    } else {
      throw Exception('No Reviews Available');
    }
  }
}