import 'package:dio/dio.dart';

import '../model/category/category_model.dart';

class CategoryAPI {
  String baseUrl = 'https://edutiv-capstone.herokuapp.com';

  Future<List<CategoryModel>> fetchAllCategory() async {
    Response response = await Dio().get(baseUrl + '/category');

    if (response.statusCode == 200) {
      List<CategoryModel> category = (response.data['data'] as List)
          .map((e) => CategoryModel.fromJson(e))
          .toList();
      return category;
    } else {
      throw Exception('No Category Available.');
    }
  }
}
