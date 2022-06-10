import 'package:edutiv/model/course/category_model.dart';
import 'package:edutiv/model/course/course_model.dart';
import 'package:flutter/material.dart';

class CourseViewModel extends ChangeNotifier {
  final List<CourseModel> _allCourse = [
    CourseModel(
      id: 1,
      courseImage: 'https://picsum.photos/id/225/200/300',
      courseName: 'Introduction to UI/UX Designer',
      mentorName: 'Bessie Cooper',
      totalTime: '3h2m',
      totalVideo: 25,
      rating: 4,
    ),
    CourseModel(
      id: 2,
      courseImage: 'https://picsum.photos/id/218/200/300',
      courseName: 'Introduction to Golang',
      mentorName: 'Sergey Brin',
      totalTime: '3h0m',
      totalVideo: 15,
      rating: 5,
    ),
    CourseModel(
      id: 3,
      courseImage: 'https://picsum.photos/id/239/200/300',
      courseName: 'Introduction to Flutter',
      mentorName: 'Filip Hracek',
      totalTime: '5h1m',
      totalVideo: 19,
      rating: 5,
    ), 
  ];

  List<CourseModel> get allCourse => _allCourse;

  final List<CategoryModel> _category = [
    CategoryModel(
      categoryId: 1,
      category: 'Backend Engineer',
      categoryIcon: 'assets/backend_ilust.jpg',
      description: 'Web Developer',
    ),
    CategoryModel(
      categoryId: 2,
      category: 'Mobile Engineer',
      categoryIcon: 'assets/mobile_ilust.jpg',
      description: 'Mobile Developer',
    ),
    CategoryModel(
      categoryId: 3,
      category: 'Frontend Engineer',
      categoryIcon: 'assets/frontend_ilust.jpg',
      description: 'Web Designer',
    ),
    CategoryModel(
      categoryId: 4,
      category: 'UI/UX Designer',
      categoryIcon: 'assets/uiux_ilust.jpg',
      description: 'Product Designer',
    ),
  ];

  List<CategoryModel> get category => _category;
}
