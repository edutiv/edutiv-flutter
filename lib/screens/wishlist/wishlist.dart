import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/course_card.dart';
import '../../model/wishlist/wishlist_viewmodel.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    var wishlishedCourse = Provider.of<WishlistViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: const TextStyle(color: Colors.black),
        centerTitle: true,
        title: const Text(
          'Wishlist Course',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: wishlishedCourse.wishlishedCourse.length,
        itemBuilder: (context, index) {
          if (index != null) {
            return Dismissible(
              key: UniqueKey(),
              onDismissed: (direction) {
                setState(() {
                  wishlishedCourse.wishlishedCourse.removeAt(index);
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text(
                          '${wishlishedCourse.wishlishedCourse[index].courseName} Removed')),
                );
              },
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/detailCourse'),
                child: CourseCard(
                  courseImage:
                      wishlishedCourse.wishlishedCourse[index].courseImage!,
                  courseName:
                      wishlishedCourse.wishlishedCourse[index].courseName!,
                  mentorName:
                      wishlishedCourse.wishlishedCourse[index].mentorName!,
                  rating: wishlishedCourse.wishlishedCourse[index].rating!,
                  totalTime:
                      wishlishedCourse.wishlishedCourse[index].totalTime!,
                  totalVideo: wishlishedCourse
                      .wishlishedCourse[index].totalVideo
                      .toString(),
                ),
              ),
            );
          } else {
            return const Center(child: Text('You Have no Wishlist'));
          }
        },
      ),
    );
  }
}
