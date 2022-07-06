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
            courseImage: data.allCourse[index].courseImage!,
            courseName: data.allCourse[index].courseName!,
            totalTime: data.allCourse[index].totalTime!,
            totalVideo: data.allCourse[index].totalVideo.toString(),
          );
        },
      ),
    );
  }
}
