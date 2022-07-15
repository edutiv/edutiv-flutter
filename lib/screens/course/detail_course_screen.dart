import 'package:edutiv/components/disabled_enroll_bottom_bar.dart';
import 'package:edutiv/model/course/course_model.dart';
import 'package:edutiv/model/profile/profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../components/enroll_bottom_bar.dart';
import '../../components/review_card.dart';
import '../../components/tools_card.dart';
import '../../model/course/course_viewmodel.dart';
import '../../model/wishlist/wishlist_viewmodel.dart';

class DetailCourseScreen extends StatefulWidget {
  final CourseModel? courseId;
  const DetailCourseScreen({Key? key, this.courseId}) : super(key: key);

  @override
  State<DetailCourseScreen> createState() => _DetailCourseScreenState();
}

class _DetailCourseScreenState extends State<DetailCourseScreen> {
  bool isDisabled = false;
  @override
  void initState() {
    Provider.of<CourseViewModel>(context, listen: false)
        .getCourseById(widget.courseId!.id!);
    Provider.of<CourseViewModel>(context, listen: false)
        .getAllReviewByCourseId(widget.courseId!.id!);
    Provider.of<ProfileViewModel>(context, listen: false).getEnrolledCourse();
    checkIsEnrolled();
    super.initState();
  }

  checkIsEnrolled() async {
    final enrolled = Provider.of<ProfileViewModel>(context, listen: false);

    if (enrolled.enrolledCourse
        .any((e) => e.course?.courseName == widget.courseId!.courseName)) {
      setState(() {
        isDisabled = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    checkIsEnrolled();
    // final detail = Provider.of<CourseViewModel>(context);
    final wishlist = Provider.of<WishlistViewModel>(context);
    final enrolledCourseData = Provider.of<ProfileViewModel>(context);

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
                  image: NetworkImage(widget.courseId!.courseImage!),
                  onError: (exception, stackTrace) {
                    Image.asset(
                      'assets/empty_image.png',
                      fit: BoxFit.cover,
                    );
                  },
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    const Color(0xFF126E64).withOpacity(1),
                    BlendMode.darken,
                  ),
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.courseId!.courseName ?? '',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
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
                                          YoutubePlayer.convertUrlToId(widget
                                                      .courseId!
                                                      .sections?[0]
                                                      .materials?[0]
                                                      .url ??
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
                      wishlist.wishlishedCourse?.add(widget.courseId!);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Added to Wishlist!')),
                      );
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
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: [
                  AboutTabSection(data: widget.courseId),
                  const LessonTabSection(),
                  const ToolsTabSection(),
                  const ReviewsTabSection(),
                ],
              ),
            ),
            isDisabled
                ? const DisabledEnrollBottomBar()
                : const EnrollBottomBar()
          ],
        ),
      ),
    );
  }
}

class AboutTabSection extends StatelessWidget {
  final CourseModel? data;
  const AboutTabSection({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final detail = Provider.of<CourseViewModel>(context);
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
                    data?.description ?? '',
                    // detail.courseData.description ?? '',
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class LessonTabSection extends StatelessWidget {
  const LessonTabSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final section = Provider.of<CourseViewModel>(context);
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
      ],
    );
  }
}

class ToolsTabSection extends StatelessWidget {
  const ToolsTabSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var detail = Provider.of<CourseViewModel>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: detail.courseData.tools?.length ?? 0,
            itemBuilder: (context, index) {
              return ToolsCard(
                toolsName: detail.courseData.tools?[index].toolsName,
                imgUrl: detail.courseData.tools?[index].toolsIcon,
                toolUrl: detail.courseData.tools?[index].url,
              );
            },
          ),
        ),
      ],
    );
  }
}

class ReviewsTabSection extends StatefulWidget {
  const ReviewsTabSection({Key? key}) : super(key: key);

  @override
  State<ReviewsTabSection> createState() => _ReviewsTabSectionState();
}

class _ReviewsTabSectionState extends State<ReviewsTabSection> {
  @override
  Widget build(BuildContext context) {
    final review = Provider.of<CourseViewModel>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: review.allReview?.length ?? 0,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              return ReviewCard(
                img: review.allReview?[index].user?.avatar ?? '',
                title: review.allReview?[index].user?.firstname ?? '',
                rating: review.allReview?[index].rating ?? 1,
                desc: review.allReview?[index].review ?? '',
              );
            },
          ),
        ),
      ],
    );
  }
}
