import 'package:edutiv/model/course/course_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/choice_chip_row.dart';
import '../../components/course_card.dart';
import '../../components/searchbar.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({Key? key}) : super(key: key);

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  bool isEmpty = false;

  @override
  void initState() {
    Provider.of<CourseViewModel>(context, listen: false).getAllCourse();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var course = Provider.of<CourseViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: const TextStyle(color: Colors.black),
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          'Course Learning',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchBar(),
            const ChoiceChipRow(),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                // shrinkWrap: true,
                itemCount: course.allCourse.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.pushNamed(
                      context,
                      '/detailCourse',
                      arguments: course.allCourse[index],
                    ),
                    child: CourseCard(
                      courseImage: course.allCourse[index].courseImage!,
                      courseName: course.allCourse[index].courseName!,
                      rating: course.allCourse[index].reviews!.isEmpty
                          ? 0
                          : course.allCourse[index].reviews![0].rating,
                      totalTime: course.allCourse[index].totalTime!,
                      totalVideo: course.allCourse[index].totalVideo.toString(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
