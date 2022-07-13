import 'package:edutiv/model/course/course_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/course_card.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({Key? key}) : super(key: key);

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  bool isEmpty = false;
  bool isSelected = false;
  TextEditingController controller = TextEditingController();
  final List categories = [
    'All',
    'Backend Engineer',
    'Frontend Engineer',
    'Mobile Developer',
    'UI/UX Designer',
  ];

  @override
  void initState() {
    Provider.of<CourseViewModel>(context, listen: false).getAllCourse();
    super.initState();
  }

  // searchCourse(String query) {
  //   var data = Provider.of<CourseViewModel>(context, listen: false);
  //   final suggestions = data.allCourse.where((c) {
  //     final courseTitle = c.courseName?.toLowerCase();
  //     final input = query.toLowerCase();
  //     return courseTitle!.contains(input);
  //   }).toList();
  //   setState(() => data.allCourse == suggestions);
  // }

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
            // const SearchBar(),
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                hintText: 'Search course...',
              ),
              onChanged: (val) {
                course.searchCourseByName(val);
              },
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 4),
                      itemBuilder: (context, index) {
                        return ChoiceChip(
                          label: Text(
                            categories[index],
                          ),
                          selected: isSelected,
                          onSelected: (selected) {
                            setState(() {
                              isSelected = selected;
                            });
                          },
                          selectedColor: Colors.green,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            // const ChoiceChipRow(),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: course.allCourse?.length ?? 0,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.pushNamed(
                      context,
                      '/detailCourse',
                      arguments: course.allCourse?[index],
                    ),
                    child: CourseCard(
                      courseImage: course.allCourse?[index].courseImage ?? '',
                      courseName: course.allCourse?[index].courseName ?? '',
                      rating: course.allCourse?[index].totalRating ?? 0,
                      totalTime: course.allCourse?[index].totalTime ?? '',
                      totalVideo:
                          course.allCourse?[index].totalVideo.toString() ?? '',
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
