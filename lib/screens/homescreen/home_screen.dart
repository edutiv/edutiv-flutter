import 'package:edutiv/components/carousel_hero.dart';
import 'package:edutiv/components/course_card.dart';
import 'package:edutiv/components/logo.dart';
import 'package:edutiv/components/teks_banner.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/category_card.dart';
import '../../model/course/course_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<CourseViewModel>(context, listen: false).getAllCategory();
    Provider.of<CourseViewModel>(context, listen: false).getAllCourse();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var course = Provider.of<CourseViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Logo(),
        actions: [
          IconButton(
            color: Colors.grey[800],
            onPressed: () {},
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CarouselHero(),
            const SizedBox(height: 8),
            const Text(
              'Explore Categories',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            GridView.builder(
              itemCount: course.allCategory.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                return CategoryCard(
                  img: course.allCategory[index].categoryImage!,
                  title: course.allCategory[index].categoryName!,
                  desc: course.allCategory[index].description!,
                );
              },
            ),
            TeksBanner(
              title: 'Top Course',
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount:
                  course.allCourse.length <= 3 ? course.allCourse.length : 3,
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
                    totalTime: course.allCourse[index].totalTime!,
                    totalVideo: course.allCourse[index].totalVideo.toString(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
