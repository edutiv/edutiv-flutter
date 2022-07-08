import 'package:edutiv/components/course_progress_card.dart';
import 'package:edutiv/model/course/course_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProgressCourseScreen extends StatefulWidget {
  const ProgressCourseScreen({Key? key}) : super(key: key);

  @override
  State<ProgressCourseScreen> createState() => _ProgressCourseScreenState();
}

class _ProgressCourseScreenState extends State<ProgressCourseScreen> {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<CourseViewModel>(context);
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemCount: 1,
        itemBuilder: (context, index) {
          return CourseProgressCard(
            courseImage: data.allCourse?[index].courseImage ?? '',
            rating: data.allCourse?[index].reviews?[index].rating ?? 0,
            courseName: data.allCourse?[index].courseName ?? '',
            categoryName: data.allCourse?[index].category?.categoryName ?? '',
            totalVideo: data.allCourse?[index].totalVideo.toString() ?? '',
          );
        },
      ),
    );
  }
}
