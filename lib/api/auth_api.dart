import 'package:dio/dio.dart';
import 'package:edutiv/model/profile/user_model.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/auth/auth_model.dart';

class AuthAPI {
  String baseUrl = 'https://edutiv-capstone.herokuapp.com';

  Future<TokenModel> login(String email, String password) async {
    try {
      EasyLoading.show(status: 'Loading...');
      Response response = await Dio().post(
        baseUrl + '/user/login',
        data: {
          'email': email,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        EasyLoading.dismiss();
        return TokenModel.fromJson(response.data);
      } else {
        throw Exception('Data Not Available');
      }
    } catch (e) {
      print(e);
      throw EasyLoading.showError('Failed to Login!');
    }
  }

  Future<UserModel> getWhoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    Response response = await Dio().get(
      baseUrl + '/user',
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
    if (response.statusCode == 200) {
      return UserModel.fromJson(response.data['data']);
    } else {
      throw Exception('Data Not Available');
    }
  }
}
