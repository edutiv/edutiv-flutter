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
  bool isLoading = true;

  @override
  void initState() {
    Provider.of<CourseViewModel>(context, listen: false).getAllCategory();
    Provider.of<CourseViewModel>(context, listen: false).getAllCourse();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var edutiv = Provider.of<CourseViewModel>(context);
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
              builder: (context, edutiv, child) {
                if (edutiv.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: edutiv.allCourse.length >= 3 ? 3 : 1,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => Navigator.pushNamed(
                        context,
                        '/detailCourse',
                        arguments: edutiv.allCourse[index],
                      ),
                      child: CourseCard(
                        courseImage: edutiv.allCourse[index].courseImage!,
                        courseName: edutiv.allCourse[index].courseName!,
                        rating: edutiv.allCourse[index].reviews!.isEmpty
                            ? 0
                            : edutiv.allCourse[index].reviews![0].rating,
                        totalTime: edutiv.allCourse[index].totalTime!,
                        totalVideo:
                            edutiv.allCourse[index].totalVideo.toString(),
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
