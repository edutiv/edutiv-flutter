import 'package:dio/dio.dart';
import 'package:edutiv/model/profile/user_model.dart';

class UserAPI {
  String baseUrl = 'https://edutiv-springboot.herokuapp.com';

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
    Response response = await Dio().get(baseUrl + '/user' + '/$id');

    if (response.statusCode == 200) {
      return UserModel.fromJson(response.data['data']);
    } else {
      throw Exception('User Not Available');
    }
  }
}
