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
      description:
          'The development of the current era of technology and the emergence of many opportunities introduces us to some new job names. Especially in the design industry, called User Interface (UI) and User Experience (UX) designers. This type of work is closely related to product design on Digital Platforms (Websites / Tablets / Apps) in the form of Digital Products, where UI/UX Design learning will be implemented with a product design process which of course requires research to create functional design results without compromising on beauty. a website/tablet/apps.',
      tools: [
        Tools(
            id: 1,
            courseId: 1,
            toolsName: 'Figma',
            toolsIcon:
                'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcdn-images-1.medium.com%2Fmax%2F1600%2F1*6XgfDCVn81AYX68Xvd2I-g%402x.png'),
        Tools(
            id: 1,
            courseId: 1,
            toolsName: 'Whimsical',
            toolsIcon:
                'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.freelogovectors.net%2Fwp-content%2Fuploads%2F2021%2F07%2Fwhimsical_logo-freelogovectors.net_-768x159.png'),
        Tools(
            id: 1,
            courseId: 1,
            toolsName: 'Maze',
            toolsIcon:
                'https://external-content.duckduckgo.com/ip3/maze.co.ico'),
      ],
    ),
    CourseModel(
      id: 2,
      courseImage: 'https://picsum.photos/id/212/200/300',
      courseName: 'Introduction to Golang',
      mentorName: 'Sergey Brin',
      totalTime: '3h0m',
      totalVideo: 15,
      rating: 5,
      description: '',
    ),
    CourseModel(
      id: 3,
      courseImage: 'https://picsum.photos/id/239/200/300',
      courseName: 'Introduction to Flutter',
      mentorName: 'Filip Hracek',
      totalTime: '5h1m',
      totalVideo: 19,
      rating: 5,
      description: '',
    ),
    CourseModel(
      id: 4,
      courseImage: 'https://picsum.photos/id/291/200/300',
      courseName: 'Introduction to React',
      mentorName: 'Filip Hracek',
      totalTime: '5h1m',
      totalVideo: 19,
      rating: 5,
      description: '',
    ),
    CourseModel(
      id: 5,
      courseImage: 'https://picsum.photos/id/172/200/300',
      courseName: 'Introduction to Java Spring Boot',
      mentorName: 'Filip Hracek',
      totalTime: '5h1m',
      totalVideo: 19,
      rating: 5,
      description: '',
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
