import 'package:flutter/material.dart';

class ProgressCourseScreen extends StatefulWidget {
  const ProgressCourseScreen({Key? key}) : super(key: key);

  @override
  State<ProgressCourseScreen> createState() => _ProgressCourseScreenState();
}

class _ProgressCourseScreenState extends State<ProgressCourseScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Progress Course'),
      ),
    );
  }
}
