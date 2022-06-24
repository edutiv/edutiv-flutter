import 'package:edutiv/components/carousel_hero.dart';
import 'package:edutiv/components/course_card.dart';
import 'package:edutiv/components/logo.dart';
import 'package:edutiv/components/teks_banner.dart';
import 'package:edutiv/model/course/category_model.dart';
import 'package:edutiv/model/course/course_model.dart';
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
  // @override
  // void initState() {
  //   Provider.of<CourseViewModel>(context, listen: false).getAllCategory();
  //   Provider.of<CourseViewModel>(context, listen: false).getAllCourse();
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    var edutiv = Provider.of<CourseViewModel>(context, listen: false);
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
            FutureBuilder<List<CategoryModel>>(
              future: edutiv.getAllCategory(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return GridView.builder(
                    itemCount: snapshot.data!.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return CategoryCard(
                        img: snapshot.data![index].categoryImage!,
                        title: snapshot.data![index].categoryName!,
                        desc: snapshot.data![index].description!,
                      );
                    },
                  );
                } else {
                  return const Text('Error');
                }
              },
            ),
            TeksBanner(
              title: 'Top Course',
            ),
            FutureBuilder<List<CourseModel>>(
              future: edutiv.getAllCourse(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length >= 3 ? 3 : 1,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => Navigator.pushNamed(
                          context,
                          '/detailCourse',
                          arguments: snapshot.data![index],
                        ),
                        child: CourseCard(
                          courseImage: snapshot.data![index].courseImage!,
                          courseName: snapshot.data![index].courseName!,
                          rating: snapshot.data![index].reviews![index].rating,
                          totalTime: snapshot.data![index].totalTime!,
                          totalVideo:
                              snapshot.data![index].totalVideo.toString(),
                        ),
                      );
                    },
                  );
                } else {
                  return const Text('Error');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
