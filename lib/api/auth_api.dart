import 'package:dio/dio.dart';

import '../model/auth/auth_model.dart';

class AuthAPI {
  String baseUrl = 'https://edutiv-capstone.herokuapp.com';

  Future<TokenModel> login(String email, String password) async {
    try {
      Response response = await Dio().post(
        baseUrl + '/user/login',
        data: {
          'email': email,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        return TokenModel.fromJson(response.data);
      } else {
        throw Exception('Data Not Available');
      }
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future getUserProfileData() async {
    //GET USER PROFILE DATA
  }

  Future logout() async {
    //IMPLEMENT USER LOGOUT
  }
}
