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
            children: [
              const SearchBar(),
              TeksBanner(
                title: 'Edutiv GO!',
                desc:
                    'Belajar mandiri sesuai ritme belajar kamu dengan berbagai video menarik dan interaktif',
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return const CourseCard();
                },
              ),
              TeksBanner(
                title: 'Edutiv Insight',
                desc: 'Diskusi langsung bersama ahlinya',
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return const CourseCard();
                },
              ),
              TeksBanner(
                title: 'Edutiv Bootcamp',
                desc: '-----------',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
