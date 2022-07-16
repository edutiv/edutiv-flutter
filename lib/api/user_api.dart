import 'dart:io';

import 'package:dio/dio.dart';
import 'package:edutiv/model/course/enrolled_course_model.dart';
import 'package:edutiv/model/profile/user_model.dart';
import 'package:edutiv/model/request/request_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserAPI {
  String baseUrl = 'https://edutiv-capstone.herokuapp.com';

  Future<List<UserModel>> fetchAllUser() async {
    Response response = await Dio().get(baseUrl + '/user');

    if (response.statusCode == 200) {
      List<UserModel> course = (response.data['data'] as List)
          .map((e) => UserModel.fromJson(e))
          .toList();
      return course;
    } else {
      throw Exception('No User Available.');
    }
  }

  Future<UserModel> fetchUserById(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    Response response = await Dio().get(
      baseUrl + '/user' + '/$id',
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(response.data['data']);
    } else {
      throw Exception('User Not Available');
    }
  }

  Future<UserModel> updateProfile(int specializationId) async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    Response response = await Dio().put(
      baseUrl + '/user/edit-user',
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
      data: {
        "specialization_id": specializationId,
      },
    );
    if (response.statusCode == 200) {
      return UserModel.fromJson(response.data['data']);
    } else {
      throw Exception('User Not Available');
    }
  }

  Future<UserModel> changePassword(
      String currentPassword, String newPassword) async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    Response response = await Dio().put(
      baseUrl + '/user/change-password',
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
      data: {
        "current_password": currentPassword,
        "new_password": newPassword,
      },
    );
    if (response.statusCode == 200) {
      return UserModel.fromJson(response.data['data']);
    } else {
      throw Exception('Failed to Change Password');
    }
  }

  Future<List<EnrolledCourseModel>> fetchEnrolledCourse() async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    Response response = await Dio().get(
      baseUrl + '/enrolled/history',
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );

    if (response.statusCode == 200) {
      List<EnrolledCourseModel> enrolledCourse = (response.data['data'] as List)
          .map((e) => EnrolledCourseModel.fromJson(e))
          .toList();
      return enrolledCourse;
    } else {
      throw Exception('No Course Available.');
    }
  }

  Future<RequestModel> requestForm(
      int userId, String title, int categoryId, String requestType) async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    Response response = await Dio().post(
      baseUrl + '/request',
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
      data: {
        "user_id": userId,
        "title": title,
        "category_id": categoryId,
        "request_type": requestType,
      },
    );
    if (response.statusCode == 200) {
      return RequestModel.fromJson(response.data['data']);
    } else {
      throw Exception('Failed to Make Request Form');
    }
  }

  Future<EnrolledCourseModel> fetchEnrolledById(int enrolledCourseId) async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    Response response = await Dio().get(
      baseUrl + '/enrolled/$enrolledCourseId',
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );

    if (response.statusCode == 200) {
      return EnrolledCourseModel.fromJson(response.data['data']);
    } else {
      throw Exception('Course Not Available');
    }
  }
}
