import 'package:dio/dio.dart';
import 'package:edutiv/model/course/course_model.dart';
import 'package:edutiv/model/course/enrolled_course_model.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/review/review_model.dart';

class CourseAPI {
  String baseUrl = 'https://edutiv-capstone.herokuapp.com';

  Future<List<CourseModel>> fetchAllCourse() async {
    Response response = await Dio().get(baseUrl + '/course');

    if (response.statusCode == 200) {
      List<CourseModel> course = (response.data['data'] as List)
          .map((e) => CourseModel.fromJson(e))
          .toList();
      return course;
    } else {
      throw Exception('No Course Available.');
    }
  }

  Future<CourseModel> fetchCourseById(int id) async {
    Response response = await Dio().get(baseUrl + '/course' + '/$id');

    if (response.statusCode == 200) {
      return CourseModel.fromJson(response.data['data']);
    } else {
      throw Exception('Course Not Available');
    }
  }

  Future enrollCourse(int userId, int courseId) async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    Response response = await Dio().post(
      baseUrl + '/enrolled',
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
      data: {
        "user_id": userId,
        "course_id": courseId,
      },
    );
    return response.data;
  }

  Future<Review> createReview(
      int enrolledCourseId, int rating, String review) async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    try {
      EasyLoading.show(status: 'Loading...');
      Response response = await Dio().put(
        baseUrl + '/enrolled/$enrolledCourseId',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
        data: {
          "rating": rating,
          "review": review,
        },
      );
      EasyLoading.showSuccess('Review Posted!');
      EasyLoading.dismiss();
      return Review.fromJson(response.data);
    } catch (e) {
      print(e);
      throw EasyLoading.showError('Failed to Update!');
    }
  }

  Future searchCourseByName(String query) async {
    Response response = await Dio().get(baseUrl + '/course/search/$query');

    if (response.statusCode == 200) {
      List<CourseModel> course = (response.data['data'] as List)
          .map((e) => CourseModel.fromJson(e))
          .toList();
      return course;
    } else if (response.statusCode == 400) {
      return query = '';
    } else {
      throw Exception('Course Not Available');
    }
  }

  Future<List<Review>> fetchAllReviewFromCourseId(int courseId) async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    Response response = await Dio().get(
      baseUrl + '/enrolled/courses/$courseId',
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );

    if (response.statusCode == 200) {
      List<Review> allReview = (response.data['data'] as List)
          .map((e) => Review.fromJson(e))
          .toList();
      return allReview;
    } else {
      throw Exception('No Reviews Available');
    }
  }

  Future<EnrolledCourseModel> updateCourseProgress(
      int enrolledCourseId, int materialId) async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    try {
      EasyLoading.show(status: 'Updating...');
      Response response = await Dio().put(
        baseUrl + '/enrolled/progress/$enrolledCourseId',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
        data: {
          "material_id": materialId,
        },
      );
      EasyLoading.dismiss();
      return EnrolledCourseModel.fromJson(response.data);
    } catch (e) {
      print(e);
      throw EasyLoading.showError('Failed to Complete!');
    }
  }
}
