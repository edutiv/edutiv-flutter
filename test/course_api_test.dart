import 'package:edutiv/api/category_api.dart';
import 'package:edutiv/api/course_api.dart';
import 'package:edutiv/api/faq_api.dart';
import 'package:test/test.dart';

void main() {
  test(
    'Get All Course Returns Data',
    () async {
      var course = await CourseAPI().fetchAllCourse();
      expect(course.isNotEmpty, true);
    },
  );

  test(
    'Get All FAQ Returns Data',
    () async {
      var faq = await FaqAPI().fetchAllFAQ();
      expect(faq.isNotEmpty, true);
    },
  );

  test(
    'Get All Category Returns Data',
    () async {
      var cat = await CategoryAPI().fetchAllCategory();
      expect(cat.isNotEmpty, true);
    },
  );
}
