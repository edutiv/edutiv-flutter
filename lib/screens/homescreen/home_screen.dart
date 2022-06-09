import 'package:edutiv/components/carousel_hero.dart';
import 'package:edutiv/components/course_card.dart';
import 'package:edutiv/components/logo.dart';
import 'package:edutiv/components/teks_banner.dart';
import 'package:flutter/material.dart';

import '../../components/category_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> ilust = [
    'assets/backend_ilust.jpg',
    'assets/mobile_ilust.jpg',
    'assets/uiux_ilust.jpg',
    'assets/frontend_ilust.jpg',
  ];

  final List<String> judul = [
    'Backend Engineer',
    'Mobile Engineer',
    'UI/UX Designer',
    'Frontend Engineer',
  ];

  final List<String> subjudul = [
    'Web Developer',
    'Mobile Developer',
    'Product Designer',
    'Web Designer',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        child: Padding(
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
                itemCount: 4,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return CategoryCard(
                    img: ilust[index],
                    title: judul[index],
                    desc: subjudul[index],
                  );
                },
              ),
              TeksBanner(
                title: 'Top Course',
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/courseInfo'),
                    child: const CourseCard(),
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
