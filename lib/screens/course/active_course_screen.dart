import 'package:edutiv/model/profile/profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/course_card.dart';

class ActiveCourseScreen extends StatefulWidget {
  const ActiveCourseScreen({Key? key}) : super(key: key);

  @override
  State<ActiveCourseScreen> createState() => _ActiveCourseScreenState();
}

class _ActiveCourseScreenState extends State<ActiveCourseScreen> {
  @override
  Widget build(BuildContext context) {
    // final user = ModalRoute.of(context)!.settings.arguments as UserModel;
    final user = Provider.of<ProfileViewModel>(context);
    //Enroll History
    return Scaffold(
      body: FutureBuilder(
        future: user.getEnrolledCourse(),
        builder: (context, snapshot) {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: user.enrolledCourse.length,
            itemBuilder: (context, index) {
              return CourseCard(
                courseImage:
                    user.enrolledCourse[index].course?.courseImage ?? '',
                courseName: user.enrolledCourse[index].course?.courseName ?? '',
                rating: user.enrolledCourse[index].rating ?? 1,
                totalTime: user.enrolledCourse[index].course?.totalTime ?? '',
                totalVideo:
                    user.enrolledCourse[index].course?.totalVideo.toString() ??
                        '',
              );
            },
          );
        },
      ),
    );
  }
}
