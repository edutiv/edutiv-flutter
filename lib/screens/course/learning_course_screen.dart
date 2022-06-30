import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../components/tools_card.dart';
import '../../model/course/course_model.dart';
import '../../model/course/course_viewmodel.dart';

class LearningCourseScreen extends StatefulWidget {
  final CourseModel? courseId;
  final String? initURL;
  const LearningCourseScreen({Key? key, this.courseId, this.initURL})
      : super(key: key);

  @override
  State<LearningCourseScreen> createState() => _LearningCourseScreenState();
}

class _LearningCourseScreenState extends State<LearningCourseScreen> {
  YoutubePlayerController? ytController;
  int sectionIndex = 0;
  int materialIndex = 0;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Provider.of<CourseViewModel>(context, listen: false)
        .getCourseById(widget.courseId!.id);
    playYT();
    setState(() {
      isLoading = false;
    });
  }

  void playYT() {
    ytController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.initURL!)!,
      flags: const YoutubePlayerFlags(
        useHybridComposition: false,
      ),
    );
  }

  @override
  void deactivate() {
    ytController!.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    ytController!.dispose();
    super.dispose();
  }

  nextVideo() {
    setState(() {
      materialIndex++;
      ytController!.load(
        YoutubePlayer.convertUrlToId(widget
            .courseId!.sections![sectionIndex].materials![materialIndex].url!)!,
      );
    });
  }

  prevVideo() {
    if (widget.courseId!.sections![sectionIndex].materials![materialIndex]
            .materialType !=
        'video') {}
    setState(() {
      materialIndex--;
      ytController!.load(
        YoutubePlayer.convertUrlToId(widget
            .courseId!.sections![sectionIndex].materials![materialIndex].url!)!,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    print(
        'Tipe ${widget.courseId!.sections![sectionIndex].materials![materialIndex].materialType!}');
    // var data = Provider.of<CourseViewModel>(context);
    int materialLength =
        widget.courseId!.sections![sectionIndex].materials!.length;
    int sectionLength = widget.courseId!.sections!.length;
    String urlBaru =
        widget.courseId!.sections![sectionIndex].materials![materialIndex].url!;
    print('haloo banggg $materialIndex');
    print('ini url videooo $urlBaru');
    return YoutubePlayerBuilder(
      player: YoutubePlayer(controller: ytController!),
      builder: (context, player) {
        return Scaffold(
          endDrawer: LearningMenuDrawer(id: widget.courseId!.id),
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: CircleAvatar(
                backgroundColor: const Color.fromARGB(62, 158, 158, 158),
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.chevron_left_outlined,
                      color: Color(0xFF126E64)),
                ),
              ),
            ),
            centerTitle: true,
            title: Text(
              widget.courseId!.courseName!,
              style: const TextStyle(color: Colors.black, fontSize: 14),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: CircleAvatar(
                  backgroundColor: const Color.fromARGB(62, 158, 158, 158),
                  child: Builder(builder: (context) {
                    return IconButton(
                      onPressed: () => Scaffold.of(context).openEndDrawer(),
                      icon: const Icon(Icons.menu, color: Color(0xFF126E64)),
                    );
                  }),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!isLoading)
                  widget.courseId!.sections![sectionIndex]
                              .materials![materialIndex].materialType ==
                          'video'
                      ? player
                      : widget.courseId!.sections![sectionIndex]
                                  .materials![materialIndex].materialType ==
                              'slide'
                          ? const CircleAvatar()
                          : Container(),
                const SizedBox(height: 16),
                const SlideWebView(),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Text(
                      widget.courseId!.sections![sectionIndex]
                          .materials![materialIndex].materialName!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          prevVideo();
                          // prevVideo(urlBaru, sectionLength, materialLength);
                          // setState(() {
                          //   materialIndex--;
                          //   ytController!.load(
                          //     YoutubePlayer.convertUrlToId(widget
                          //         .courseId!
                          //         .sections![sectionIndex]
                          //         .materials![materialIndex]
                          //         .url!)!,
                          //   );
                          // });
                        },
                        // Navigator.pushNamed(context, '/successCourse');
                        child: const Text('Previous'),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          nextVideo();
                          // setState(() {
                          //   materialIndex++;
                          //   ytController!.load(
                          //     YoutubePlayer.convertUrlToId(widget
                          //         .courseId!
                          //         .sections![sectionIndex]
                          //         .materials![materialIndex]
                          //         .url!)!,
                          //   );
                          // });
                        },
                        // Navigator.pushNamed(context, '/successCourse');
                        child: const Text('Next Video'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: const [
                    Text(
                      'Tools Course',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  height: 290,
                  child: Consumer<CourseViewModel>(
                    builder: (context, data, child) {
                      return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: data.courseData.tools!.length,
                        itemBuilder: (context, index) {
                          return ToolsCard(
                            toolsName: data.courseData.tools![index].toolsName,
                            imgUrl: data.courseData.tools![index].toolsIcon,
                          );
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class SlideWebView extends StatelessWidget {
  const SlideWebView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      height: 250,
      child: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl:
            'https://www.slideshare.net/slideshow/embed_code/key/96RRG7B2iq0Tqn',
      ),
    );
  }
}

class LearningMenuDrawer extends StatefulWidget {
  int id;
  LearningMenuDrawer({Key? key, required this.id}) : super(key: key);

  @override
  State<LearningMenuDrawer> createState() => _LearningMenuDrawerState();
}

class _LearningMenuDrawerState extends State<LearningMenuDrawer> {
  @override
  void didChangeDependencies() {
    // final courseDetail =
    //     ModalRoute.of(context)!.settings.arguments as CourseModel;
    Provider.of<CourseViewModel>(context, listen: false)
        .getCourseById(widget.id);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var section = Provider.of<CourseViewModel>(context, listen: false);
    return Drawer(
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: section.courseData.sections!.length,
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
                        itemCount: section
                            .courseData.sections![index].materials!.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 8),
                        itemBuilder: (context, subIndex) {
                          return ListTile(
                            onTap: () {},
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
