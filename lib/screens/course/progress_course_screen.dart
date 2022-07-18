import 'package:edutiv/components/course_progress_card.dart';
import 'package:edutiv/model/profile/profile_viewmodel.dart';
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
    final data = Provider.of<ProfileViewModel>(context);
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemCount: data.enrolledCourse.length,
        itemBuilder: (context, index) {
          return CourseProgressCard(
            courseImage: data.enrolledCourse[index].course?.courseImage ?? '',
            rating: data.enrolledCourse[index].course?.totalRating ?? 0,
            courseName: data.enrolledCourse[index].course?.courseName ?? '',
            categoryName:
                data.enrolledCourse[index].course?.category?.categoryName ?? '',
            progress: data.enrolledCourse[index].progress!.toDouble() / 100,
            teksProgressPersen: data.enrolledCourse[index].progress!.toInt(),
          );
        },
      ),
    );
  }
}
