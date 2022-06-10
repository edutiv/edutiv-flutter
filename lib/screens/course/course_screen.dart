import 'package:edutiv/model/course/course_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/course_card.dart';
import '../../components/searchbar.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({Key? key}) : super(key: key);

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  @override
  Widget build(BuildContext context) {
    var course = Provider.of<CourseViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: const TextStyle(color: Colors.black),
        centerTitle: true,
        title: const Text(
          'Course Learning',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchBar(),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: course.allCourse.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/detailCourse'),
                    child: CourseCard(
                      courseImage: course.allCourse[index].courseImage,
                      courseName: course.allCourse[index].courseName,
                      mentorName: course.allCourse[index].mentorName,
                      rating: course.allCourse[index].rating,
                      totalTime: course.allCourse[index].totalTime,
                      totalVideo: course.allCourse[index].totalVideo.toString(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
