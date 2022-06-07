import 'package:edutiv/components/carousel_hero.dart';
import 'package:edutiv/components/course_card.dart';
import 'package:edutiv/components/logo.dart';
import 'package:edutiv/components/searchbar.dart';
import 'package:edutiv/components/teks_banner.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              const SearchBar(),
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
                  return Card(
                    elevation: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                            'https://picsum.photos/200/',
                          ),
                        ),
                        const Text(
                          'TITLE',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Sub Category',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey[800],
                          ),
                        ),
                      ],
                    ),
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
                  return const CourseCard();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
