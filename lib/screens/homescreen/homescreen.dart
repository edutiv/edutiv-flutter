import 'package:edutiv/components/logo.dart';
import 'package:flutter/material.dart';

import '../../components/course_card.dart';

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
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () => Navigator.pushNamed(context, '/search'),
            child: Ink(
              padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
              width: 300,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: const [
                  Icon(Icons.search),
                  SizedBox(width: 8),
                  Text('Search'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Edutiv GO!',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'See all',
                      style: TextStyle(color: Color(0xFF126E64)),
                    )),
              ],
            ),
          ),
          const CourseCard(),
          const CourseCard(),
          const CourseCard(),
          const CourseCard(),
          const CourseCard(),
        ],
      ),
    );
  }
}
