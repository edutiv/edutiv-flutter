import 'package:flutter/material.dart';

class HistoryCourseScreen extends StatefulWidget {
  const HistoryCourseScreen({Key? key}) : super(key: key);

  @override
  State<HistoryCourseScreen> createState() => _HistoryCourseScreenState();
}

class _HistoryCourseScreenState extends State<HistoryCourseScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('History Course'),
      ),
    );
  }
}
