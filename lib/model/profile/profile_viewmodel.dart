import 'package:edutiv/api/user_api.dart';
import 'package:edutiv/model/profile/user_model.dart';
import 'package:flutter/material.dart';

import '../course/course_model.dart';

class ProfileViewModel extends ChangeNotifier {
  bool isLoading = true;

  final List<CourseModel> _enrolledCourse = [];
  List<CourseModel> get enrolledCourse => _enrolledCourse;

  late UserModel _userData;
  UserModel get userData => _userData;

  Future<UserModel> getUserById(int id) async {
    final user = await UserAPI().fetchUserById(id);
    _userData = user;
    isLoading = false;
    notifyListeners();
    return user;
  }

  Future<UserModel> updateProfile(int userId, String firstname, String lastname,
      String email, var password, int specializationId) async {
    final updatedUser = await UserAPI().updateProfile(
      userId,
      firstname,
      lastname,
      email,
      password,
      specializationId,
    );
    // print(updatedUser.firstname);
    _userData = updatedUser;
    notifyListeners();
    return updatedUser;
  }
}
