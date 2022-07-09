import 'package:edutiv/components/carousel_hero.dart';
import 'package:edutiv/components/logo.dart';
import 'package:edutiv/components/teks_banner.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/category_card.dart';
import '../../components/course_card.dart';
import '../../model/course/course_viewmodel.dart';
import '../../model/profile/profile_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // bool isLoading = true;

  @override
  void initState() {
    Provider.of<CourseViewModel>(context, listen: false).getAllCategory();
    Provider.of<CourseViewModel>(context, listen: false).getAllCourse();
    // Provider.of<ProfileViewModel>(context, listen: false).getUserById(widget.id!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<CourseViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Logo(),
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
            Consumer<CourseViewModel>(builder: (context, edutiv, child) {
              if (edutiv.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              return GridView.builder(
                itemCount: edutiv.allCategory.length >= 4 ? 4 : 1,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return CategoryCard(
                    img: edutiv.allCategory[index].categoryImage!,
                    title: edutiv.allCategory[index].categoryName!,
                    desc: edutiv.allCategory[index].description!,
                  );
                },
              );
            }),
            TeksBanner(
              title: 'Top Course',
            ),
            Consumer<CourseViewModel>(
              builder: (context, courseData, child) {
                if (courseData.isLoading2) {
                  return const Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: courseData.allCourse!.length >= 3 ? 3 : 1,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => Navigator.pushNamed(
                        context,
                        '/detailCourse',
                        arguments: courseData.allCourse?[index],
                      ),
                      child: CourseCard(
                        courseImage:
                            courseData.allCourse?[index].courseImage ?? '-',
                        courseName:
                            courseData.allCourse?[index].courseName ?? '-',
                        rating: courseData
                                .allCourse?[index].reviews?[index].rating ??
                            0,
                        totalTime:
                            courseData.allCourse?[index].totalTime ?? '-',
                        totalVideo: courseData.allCourse?[index].totalVideo
                                .toString() ??
                            '-',
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
