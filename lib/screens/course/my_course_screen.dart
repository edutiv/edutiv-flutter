import 'package:edutiv/screens/screen.dart';
import 'package:flutter/material.dart';

class MyCourseScreen extends StatefulWidget {
  const MyCourseScreen({Key? key}) : super(key: key);

  @override
  State<MyCourseScreen> createState() => _MyCourseScreenState();
}

class _MyCourseScreenState extends State<MyCourseScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          titleTextStyle: const TextStyle(color: Colors.black),
          centerTitle: true,
          title: const Text(
            'Course Learning',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              onPressed: () => Navigator.pushNamed(context, '/courseDetail'),
              icon: const Icon(Icons.bookmark_outline, color: Colors.black),
            ),
            IconButton(
              onPressed: () => Navigator.pushNamed(context, '/courseInfo'),
              icon: const Icon(Icons.info_outline, color: Colors.black),
            ),
          ],
          bottom: const TabBar(
            indicatorColor: Color(0xFF126E64),
            labelColor: Colors.black,
            tabs: [
              Tab(text: 'Active'),
              Tab(text: 'History'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ActiveCourseScreen(),
            HistoryCourseScreen(),
          ],
        ),
      ),
    );
  }
}
