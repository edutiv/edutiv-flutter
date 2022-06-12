import 'package:edutiv/model/course/course_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/enroll_bottom_bar.dart';
import '../../components/review_card.dart';
import '../../components/tools_card.dart';
import '../../model/wishlist/wishlist_viewmodel.dart';

class DetailCourseScreen extends StatefulWidget {
  const DetailCourseScreen({Key? key}) : super(key: key);

  @override
  State<DetailCourseScreen> createState() => _DetailCourseScreenState();
}

class _DetailCourseScreenState extends State<DetailCourseScreen> {
  @override
  Widget build(BuildContext context) {
    final courseDetail =
        ModalRoute.of(context)!.settings.arguments as CourseModel;
    var wishlist = Provider.of<WishlistViewModel>(context);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(250),
          child: AppBar(
            leading: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: CircleAvatar(
                backgroundColor: const Color.fromARGB(62, 158, 158, 158),
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.chevron_left_outlined,
                      color: Colors.white),
                ),
              ),
            ),
            iconTheme: const IconThemeData(color: Colors.white),
            titleTextStyle: const TextStyle(color: Colors.white),
            centerTitle: true,
            flexibleSpace: Container(
              height: 220,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(courseDetail.courseImage!),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      const Color(0xFF126E64).withOpacity(1), BlendMode.darken),
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                // color: const Color(0xFF258b80),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      courseDetail.courseName!,
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.play_circle_outline_outlined,
                        color: Colors.white,
                      ),
                      label: const Text(
                        'Preview Course',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            title: const Text(
              'Details Course',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: CircleAvatar(
                  backgroundColor: const Color.fromARGB(62, 158, 158, 158),
                  child: IconButton(
                    onPressed: () {
                      wishlist.wishlishedCourse.add(courseDetail);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Added to Wishlist!')),
                      );
                      print(wishlist.wishlishedCourse);
                    },
                    icon:
                        const Icon(Icons.bookmark_outline, color: Colors.white),
                  ),
                ),
              ),
            ],
            bottom: const TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Color(0xFF126E64),
              labelColor: Colors.black,
              tabs: [
                Tab(text: 'About'),
                Tab(text: 'Lesson'),
                Tab(text: 'Tools'),
                Tab(text: 'Reviews'),
              ],
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            AboutTabSection(),
            LessonTabSection(),
            ToolsTabSection(),
            ReviewsTabSection(),
          ],
        ),
      ),
    );
  }
}

class ReviewsTabSection extends StatelessWidget {
  const ReviewsTabSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> ilust = [
      'assets/backend_ilust.jpg',
      'assets/mobile_ilust.jpg',
      'assets/uiux_ilust.jpg',
      'assets/frontend_ilust.jpg',
    ];

    final List<String> judul = [
      'Backend Engineer',
      'Mobile Engineer',
      'UI/UX Designer',
      'Frontend Engineer',
    ];

    final List<String> subjudul = [
      'Web Developer',
      'Mobile Developer',
      'Product Designer',
      'Web Designer',
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: 4,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return ReviewCard(
                img: ilust[index],
                title: judul[index],
                desc: subjudul[index],
              );
            },
          ),
        ),
        const EnrollBottomBar()
      ],
    );
  }
}

class ToolsTabSection extends StatelessWidget {
  const ToolsTabSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final courseDetail =
        ModalRoute.of(context)!.settings.arguments as CourseModel;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: courseDetail.tools?.length,
            itemBuilder: (context, index) {
              return ToolsCard(
                toolsName: courseDetail.tools![index].toolsName!,
                imgUrl: courseDetail.tools?[index].toolsIcon,
              );
            },
          ),
        ),
        const EnrollBottomBar(),
      ],
    );
  }
}

class LessonTabSection extends StatefulWidget {
  const LessonTabSection({
    Key? key,
  }) : super(key: key);

  @override
  State<LessonTabSection> createState() => _LessonTabSectionState();
}

class _LessonTabSectionState extends State<LessonTabSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: 5,
            separatorBuilder: (context, index) {
              return const SizedBox(height: 8);
            },
            itemBuilder: ((context, index) {
              return ListTile(
                tileColor: Colors.grey[200],
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                leading: const Icon(Icons.play_circle_fill_outlined),
                title: const Text('Pengenalan Figma'),
              );
            }),
          ),
        ),
        const EnrollBottomBar(),
      ],
    );
  }
}

class AboutTabSection extends StatelessWidget {
  const AboutTabSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final courseDetail =
        ModalRoute.of(context)!.settings.arguments as CourseModel;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(
                    courseDetail.description!,
                  ),
                ),
              ],
            ),
          ),
        ),
        const EnrollBottomBar(),
      ],
    );
  }
}
