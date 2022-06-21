import 'package:dio/dio.dart';
import 'package:edutiv/model/course/category_model.dart';

class CategoryAPI {
  Dio dio = Dio(
    BaseOptions(baseUrl: 'https://edutiv-springboot.herokuapp.com/'),
  );

  Future<List<CategoryModel>> fetchAllCategory() async {
    Response response =
        await Dio().get('https://edutiv-springboot.herokuapp.com/category');

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
