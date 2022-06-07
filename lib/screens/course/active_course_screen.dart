import 'package:flutter/material.dart';

class ActiveCourseScreen extends StatefulWidget {
  const ActiveCourseScreen({Key? key}) : super(key: key);

  @override
  State<ActiveCourseScreen> createState() => _ActiveCourseScreenState();
}

class _ActiveCourseScreenState extends State<ActiveCourseScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Active Course'),
      ),
    );
  }
}