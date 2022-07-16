import 'dart:io';

import 'package:edutiv/api/auth_api.dart';
import 'package:edutiv/api/faq_api.dart';
import 'package:edutiv/api/user_api.dart';
import 'package:edutiv/model/course/enrolled_course_model.dart';
import 'package:edutiv/model/faq/faq_model.dart';
import 'package:edutiv/model/profile/user_model.dart';
import 'package:edutiv/model/request/request_model.dart';
import 'package:flutter/material.dart';

import '../../api/course_api.dart';

class ProfileViewModel extends ChangeNotifier {
  bool isLoading = true;
  bool isLoadingData = true;

  List<EnrolledCourseModel> _enrolledCourse = [];
  List<EnrolledCourseModel> get enrolledCourse => _enrolledCourse;

  List<EnrolledCourseModel> _finishedCourse = [];
  List<EnrolledCourseModel> get finishedCourse => _finishedCourse;

  List<FAQModel> _allFAQ = [];
  List<FAQModel> get allFAQ => _allFAQ;

  late UserModel _userData;
  UserModel get userData => _userData;

  late EnrolledCourseModel _enrolledCourseData;
  EnrolledCourseModel get enrolledCourseData => _enrolledCourseData;

  File? _reportData;
  File get reportData => _reportData!;

  Future<UserModel> getUserById(int id) async {
    final user = await UserAPI().fetchUserById(id);
    _userData = user;
    isLoading = false;
    notifyListeners();
    return user;
  }

  Future<UserModel> updateProfile(int specializationId) async {
    final updatedUser = await UserAPI().updateProfile(
      specializationId,
    );
    _userData = updatedUser;
    notifyListeners();
    return updatedUser;
  }

  Future<UserModel> getWhoLogin() async {
    final whoLoggedIn = await AuthAPI().getWhoLogin();
    _userData = whoLoggedIn;
    isLoading = false;
    notifyListeners();
    return whoLoggedIn;
  }

  Future<UserModel> changePassword(
      String currentPassword, String newPassword) async {
    final changedPassword =
        await UserAPI().changePassword(currentPassword, newPassword);
    _userData = changedPassword;
    notifyListeners();
    return changedPassword;
  }

  Future<List<EnrolledCourseModel>> getEnrolledCourse() async {
    final enrolled = await UserAPI().fetchEnrolledCourse();
    _enrolledCourse = enrolled;
    notifyListeners();
    return enrolled;
  }

  Future<RequestModel> requestForm(
      int userId, String title, int categoryId, String requestType) async {
    final request =
        await UserAPI().requestForm(userId, title, categoryId, requestType);
    notifyListeners();
    return request;
  }

  Future<List<FAQModel>> getAllFAQ() async {
    final faqData = await FaqAPI().fetchAllFAQ();
    _allFAQ = faqData;
    notifyListeners();
    return allFAQ;
  }

  Future<EnrolledCourseModel> getEnrolledById(int enrolledCourseId) async {
    isLoadingData;
    final enrolledData = await UserAPI().fetchEnrolledById(enrolledCourseId);
    _enrolledCourseData = enrolledData;
    isLoadingData = false;
    notifyListeners();
    return enrolledData;
  }

  Future<List<EnrolledCourseModel>> getFinishedCourse() async {
    final done = enrolledCourse.where((e) => e.progress == 100).toList();
    _finishedCourse = done;
    // notifyListeners();
    return done;
  }

  Future<EnrolledCourseModel> updateCourseProgress(
      int enrolledCourseId, int materialId) async {
    final updateProgress =
        await CourseAPI().updateCourseProgress(enrolledCourseId, materialId);
    notifyListeners();
    return updateProgress;
  }
}
