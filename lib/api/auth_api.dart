import 'package:dio/dio.dart';

class AuthAPI {
  String baseUrl = 'https://edutiv-capstone.herokuapp.com';

  Future login(String email, String password) async {
    try {
      Response response = await Dio().post(
        baseUrl + '/user/login',
        data: {'email': email, 'password': password},
      );
      return response.data;
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
