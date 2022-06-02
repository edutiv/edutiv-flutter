import 'package:flutter/material.dart';

import '../../components/logo.dart';

class MyCourseScreen extends StatefulWidget {
  const MyCourseScreen({Key? key}) : super(key: key);

  @override
  State<MyCourseScreen> createState() => _MyCourseScreenState();
}

class _MyCourseScreenState extends State<MyCourseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Logo(),
      ),
      body: const Center(
        child: Text('My Course'),
      ),
    );
  }
}
