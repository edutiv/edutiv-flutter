import 'dart:io';

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
  WebViewController? slideController;
  WebViewController? quizController;
  int sectionIndex = 0;
  int materialIndex = 0;
  bool isLoading = true;
  String widgetType = '';
  bool isToolsVisible = true;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    Provider.of<CourseViewModel>(context, listen: false)
        .getCourseById(widget.courseId!.id!);
    playYT();
    // slideController;
    // quizController;
    setState(() {
      isLoading = false;
    });
  }

  void playYT() {
    ytController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
          widget.courseId!.sections![sectionIndex].materials![0].url!)!,
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

  getMaterialType() {
    String materialType = widget.courseId!.sections![sectionIndex]
        .materials![materialIndex].materialType!;
    if (materialType == 'video') {
      setState(() {
        widgetType = '';
        isToolsVisible = true;
        ytController!.load(
          YoutubePlayer.convertUrlToId(widget.courseId!.sections![sectionIndex]
              .materials![materialIndex].url!)!,
        );
      });
    }
    if (materialType == 'slide') {
      setState(() {
        widgetType = 'slide';
        isToolsVisible = true;
      });
    }
    if (materialType == 'quiz') {
      setState(() {
        widgetType = 'quiz';
        isToolsVisible = false;
      });
    }
  }

  nextVideo() {
    int materialLength =
        widget.courseId!.sections![sectionIndex].materials!.length;
    int sectionLength = widget.courseId!.sections!.length;

    if (sectionIndex == sectionLength - 1 &&
        materialIndex == materialLength - 1) {
      Navigator.pushReplacementNamed(context, '/successCourse',
          arguments: widget.courseId);
    }

    if (materialIndex < materialLength - 1) {
      materialIndex++;
      getMaterialType();
    } else {
      setState(() {
        sectionIndex++;
        materialIndex = 0;
        getMaterialType();
      });
    }
  }

  prevVideo() {
    setState(() {
      materialIndex--;
      ytController!.load(
        YoutubePlayer.convertUrlToId(widget
            .courseId!.sections![sectionIndex].materials![materialIndex].url!)!,
      );
    });
  }

  slideView() {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: widget
            .courseId!.sections![sectionIndex].materials![materialIndex].url!,
        onWebViewCreated: (controller) {
          controller = slideController!;
        },
      ),
    );
  }

  quizView() {
    String quizUrl =
        widget.courseId!.sections![sectionIndex].materials![materialIndex].url!;
    return Material(
      child: SizedBox(
        height: 450,
        width: double.infinity,
        child: WebView(
          userAgent: 'fake',
          gestureNavigationEnabled: true,
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: quizUrl,
          onWebViewCreated: (controller) {
            controller = quizController!;
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int sectionLength = widget.courseId!.sections!.length;
    print('haloo banggg $materialIndex');
    print('ini $sectionLength');
    print('ini material index $materialIndex');
    print('ini section index $sectionIndex');
    return YoutubePlayerBuilder(
      player: YoutubePlayer(controller: ytController!),
      builder: (context, player) {
        return Scaffold(
          endDrawer: LearningMenuDrawer(id: widget.courseId!.id!),
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
              softWrap: true,
              overflow: TextOverflow.ellipsis,
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
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!isLoading)
                  widgetType == ''
                      ? player
                      : widgetType == 'slide'
                          ? slideView()
                          : widgetType == 'quiz'
                              ? quizView()
                              : widgetType = '',
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.courseId!.sections![sectionIndex]
                            .materials![materialIndex].materialName!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
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
                        },
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
                        },
                        child: const Text('Next Video'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Visibility(
                  visible: isToolsVisible,
                  child: Row(
                    children: const [
                      Text(
                        'Tools Course',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: isToolsVisible,
                  child: SizedBox(
                    width: double.infinity,
                    height: 290,
                    child: Consumer<CourseViewModel>(
                      builder: (context, data, child) {
                        return ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: data.courseData.tools?.length ?? 0,
                          itemBuilder: (context, index) {
                            return ToolsCard(
                              toolsName:
                                  data.courseData.tools![index].toolsName,
                              imgUrl: data.courseData.tools![index].toolsIcon,
                            );
                          },
                        );
                      },
                    ),
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
