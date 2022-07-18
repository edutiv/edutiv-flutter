import 'package:dio/dio.dart';
import 'package:edutiv/model/faq/faq_model.dart';

class FaqAPI {
  String baseUrl = 'https://edutiv-capstone.herokuapp.com';

  Future<List<FAQModel>> fetchAllFAQ() async {
    Response response = await Dio().get(baseUrl + '/faq');
    if (response.statusCode == 200) {
      List<FAQModel> faq = (response.data['data'] as List)
          .map((e) => FAQModel.fromJson(e))
          .toList();
      return faq;
    } else {
      throw Exception('No User Available.');
    }
  }
}
