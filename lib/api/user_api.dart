import 'package:dio/dio.dart';
import 'package:edutiv/model/profile/user_model.dart';

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
    Response response = await Dio().get(baseUrl + '/user' + '/$id');

    if (response.statusCode == 200) {
      return UserModel.fromJson(response.data['data']);
    } else {
      throw Exception('User Not Available');
    }
  }

  Future<UserModel> updateProfile(int userId, int specializationId,
      String email, firstname, lastname, var password) async {
    Response response = await Dio().put(baseUrl + '/user' + '/$userId', data: {
      "id": userId,
      "firstname": firstname,
      "lastname": lastname,
      "username": email,
      "password": password,
      "specialization_id": specializationId,
    });
    return UserModel.fromJson(response.data);
  }
}
