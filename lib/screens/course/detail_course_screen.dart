import 'package:edutiv/model/course/course_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../components/enroll_bottom_bar.dart';
import '../../components/review_card.dart';
import '../../components/tools_card.dart';
import '../../model/course/course_viewmodel.dart';
import '../../model/wishlist/wishlist_viewmodel.dart';

class DetailCourseScreen extends StatefulWidget {
  const DetailCourseScreen({Key? key}) : super(key: key);

  @override
  State<DetailCourseScreen> createState() => _DetailCourseScreenState();
}

class _DetailCourseScreenState extends State<DetailCourseScreen> {
  @override
  void didChangeDependencies() {
    final courseDetail =
        ModalRoute.of(context)!.settings.arguments as CourseModel;
    Provider.of<CourseViewModel>(context).getCourseById(courseDetail.id!);
    super.didChangeDependencies();
  }

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
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    TextButton.icon(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return SimpleDialog(
                              contentPadding: EdgeInsets.zero,
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  height: 200,
                                  child: YoutubePlayer(
                                    bottomActions: [
                                      CurrentPosition(),
                                      ProgressBar(isExpanded: true),
                                      RemainingDuration(),
                                    ],
                                    controller: YoutubePlayerController(
                                      initialVideoId:
                                          YoutubePlayer.convertUrlToId(
                                                  courseDetail.sections?[0]
                                                          .materials?[0].url ??
                                                      '') ??
                                              '',
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
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

class LessonTabSection extends StatelessWidget {
  const LessonTabSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var section = Provider.of<CourseViewModel>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Consumer<CourseViewModel>(
            builder: (context, section, child) {
              if (section.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              return ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                itemCount: section.courseData.sections?.length ?? 0,
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(section.courseData.sections![index].sectionName!),
                      const SizedBox(height: 8),
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: section.courseData.sections?[index].materials
                                ?.length ??
                            0,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 8),
                        itemBuilder: (context, subIndex) {
                          return ListTile(
                            tileColor: Colors.grey[200],
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            leading: section.courseData.sections![index]
                                        .materials![subIndex].materialType ==
                                    'slide'
                                ? const Icon(Icons.slideshow_rounded)
                                : section
                                            .courseData
                                            .sections![index]
                                            .materials![subIndex]
                                            .materialType ==
                                        'quiz'
                                    ? const Icon(Icons.history_edu_rounded)
                                    : const Icon(
                                        Icons.play_circle_filled_rounded),
                            title: Text(
                              section.courseData.sections![index]
                                  .materials![subIndex].materialName!,
                            ),
                          );
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
        const EnrollBottomBar(),
      ],
    );
  }
}

class ToolsTabSection extends StatelessWidget {
  const ToolsTabSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tools = Provider.of<CourseViewModel>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: tools.courseData.tools!.length,
            itemBuilder: (context, index) {
              return ToolsCard(
                toolsName: tools.courseData.tools![index].toolsName,
                imgUrl: tools.courseData.tools![index].toolsIcon,
              );
            },
          ),
        ),
        const EnrollBottomBar(),
      ],
    );
  }
}

class ReviewsTabSection extends StatelessWidget {
  const ReviewsTabSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var review = Provider.of<CourseViewModel>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: review.courseData.reviews?.length ?? 0,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              return ReviewCard(
                img: review.courseData.reviews![index].user!.id.toString(),
                title: review.courseData.reviews![index].user!.firstname!,
                rating:
                    review.courseData.reviews?[index].rating?.toDouble() ?? 1,
                desc: review.courseData.reviews![index].review!,
              );
            },
          ),
        ),
        const EnrollBottomBar(),
      ],
    );
  }
}
