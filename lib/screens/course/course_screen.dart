import 'package:edutiv/model/course/course_viewmodel.dart';
import 'package:edutiv/screens/course/detail_course_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/course_card.dart';
import '../../model/choiceChip/choice_chip_data.dart';
import '../../model/choiceChip/choice_chip_model.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({Key? key}) : super(key: key);

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  bool isEmpty = false;
  // bool isSelected = false;
  List<ChoiceChipData> choiceChips = ChoiceChips.all;
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
            //Filter ChoiceChip ROW
            Row(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Wrap(
                          runSpacing: 8,
                          spacing: 8,
                          children: choiceChips
                              .map(
                                (choiceChip) => ChoiceChip(
                                  label: Text(choiceChip.label!),
                                  labelStyle: const TextStyle(
                                    color: Colors.white,
                                  ),
                                  selected: choiceChip.isSelected,
                                  selectedColor: const Color(0xFF126E64),
                                  backgroundColor: Colors.grey[500],
                                  onSelected: (isSelected) => setState(() {
                                    choiceChips = choiceChips.map((otherChip) {
                                      final newChip =
                                          otherChip.copy(isSelected: false);
                                      return choiceChip == newChip
                                          ? newChip.copy(isSelected: isSelected)
                                          : newChip;
                                    }).toList();
                                    course.filterCourseByCategory(
                                      choiceChip.label!,
                                    );
                                    //////////////////setState//////////////////
                                  }),
                                ),
                              )
                              .toList(),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            /////////END OF Filter ChoiceChip ROW///////////////////
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: course.allCourse?.length ?? 0,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailCourseScreen(
                            courseId: course.allCourse?[index],
                          ),
                        ),
                      );
                    },
                    // Navigator.pushNamed(
                    //   context,
                    //   '/detailCourse',
                    //   arguments: course.allCourse?[index],
                    // ),
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
