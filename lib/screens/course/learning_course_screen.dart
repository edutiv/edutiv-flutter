import 'dart:io';

import 'package:edutiv/model/course/enrolled_course_model.dart';
import 'package:edutiv/model/profile/profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../components/tools_card.dart';

class LearningCourseScreen extends StatefulWidget {
  final EnrolledCourseModel? courseId;
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
  int reportsIndex = 0;
  bool isLoading = true;
  String widgetType = '';
  bool isToolsVisible = true;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    Provider.of<ProfileViewModel>(context, listen: false)
        .getEnrolledById(widget.courseId!.id!)
        .whenComplete(() {
      setState(() {});
    });
    playYT();
    setState(() {
      isLoading = false;
    });
  }

  void playYT() {
    ytController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
          widget.courseId!.course!.sections![sectionIndex].materials![0].url!)!,
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
    String materialType = widget.courseId!.course!.sections![sectionIndex]
        .materials![materialIndex].materialType!;
    if (materialType == 'video') {
      setState(() {
        widgetType = '';
        isToolsVisible = true;
        ytController!.load(
          YoutubePlayer.convertUrlToId(widget.courseId!.course!
              .sections![sectionIndex].materials![materialIndex].url!)!,
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
        widget.courseId!.course!.sections![sectionIndex].materials!.length;
    int sectionLength = widget.courseId!.course!.sections!.length;
    int reportsLength = widget.courseId!.reports!.length;

    if (sectionIndex == sectionLength - 1 &&
        materialIndex == materialLength - 1) {
      Navigator.pushReplacementNamed(context, '/successCourse',
          arguments: widget.courseId);
    }

    if (reportsIndex == reportsLength - 1 ||
        sectionIndex == sectionLength - 1 &&
            materialIndex == materialLength - 1) {
      Navigator.pushReplacementNamed(context, '/successCourse',
          arguments: widget.courseId);
      // return;
    } else {
      reportsIndex++;
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
    int materialLength =
        widget.courseId!.course!.sections![sectionIndex].materials!.length;
    int sectionLength = widget.courseId!.course!.sections!.length;

    if (materialIndex != 0) {
      setState(() {
        materialIndex--;
        ytController!.load(
          YoutubePlayer.convertUrlToId(widget.courseId!.course!
              .sections![sectionIndex].materials![materialIndex].url!)!,
        );
      });
    } else {
      return;
    }
  }

  slideView() {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: widget.courseId!.course!.sections![sectionIndex]
            .materials![materialIndex].url!,
        onWebViewCreated: (controller) {
          controller = slideController!;
        },
      ),
    );
  }

  quizView() {
    String quizUrl = widget.courseId!.course!.sections![sectionIndex]
        .materials![materialIndex].url!;
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
    int sectionLength = widget.courseId!.course!.sections!.length;
    final enrolledData = Provider.of<ProfileViewModel>(context);
    final courseVM = Provider.of<ProfileViewModel>(context);
    print('ini haloo banggg $materialIndex');
    print('ini $sectionLength');
    print('ini material index $materialIndex');
    print('ini section index $sectionIndex');
    // print('ini all reports ${widget.courseId?.reports}');
    print('ini reports index $reportsIndex');
    print('ini reports ${widget.courseId?.reports?[reportsIndex].id}');
    print(
        'ini reports ${widget.courseId?.reports?[reportsIndex].material?.materialName}');
    print(
        'ini reports data ${widget.courseId?.reports?[reportsIndex].isCompleted}');
    print('ini Jumlah reports ${widget.courseId?.reports?.length}');
    return YoutubePlayerBuilder(
      player: YoutubePlayer(controller: ytController!),
      builder: (context, player) {
        return Scaffold(
          endDrawer: LearningMenuDrawer(
              id: widget.courseId!.id!, courseId: widget.courseId),
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
              widget.courseId!.course!.courseName!,
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
                        widget.courseId!.course!.sections![sectionIndex]
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
                    const SizedBox(width: 8),
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
                Row(
                  children: [
                    Expanded(
                      child: Consumer<ProfileViewModel>(
                          builder: (context, progress, child) {
                        if (progress.isLoadingData) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else {
                          return OutlinedButton.icon(
                            onPressed: () async {
                              await progress.updateCourseProgress(
                                widget.courseId!.id!,
                                widget.courseId!.reports![reportsIndex]
                                    .material!.id,
                              );
                              await Provider.of<ProfileViewModel>(context,
                                      listen: false)
                                  .getEnrolledById(widget.courseId!.id!);
                              setState(() {});
                            },
                            icon: enrolledData.enrolledCourseData
                                    .reports![reportsIndex].isCompleted!
                                ? const Icon(Icons.check_box)
                                : const Icon(Icons.check_box_outline_blank),
                            label: const Text('Complete'),
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          );
                        }
                      }),
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
                    child: Consumer<ProfileViewModel>(
                      builder: (context, data, child) {
                        if (data.isLoadingData) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else {
                          return ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount:
                                data.enrolledCourseData.course?.tools?.length ??
                                    0,
                            itemBuilder: (context, index) {
                              return ToolsCard(
                                toolsName: data.enrolledCourseData.course
                                    ?.tools![index].toolsName,
                                imgUrl: data.enrolledCourseData.course
                                    ?.tools![index].toolsIcon,
                                toolUrl: data.enrolledCourseData.course
                                    ?.tools?[index].url,
                              );
                            },
                          );
                        }
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
  final EnrolledCourseModel? courseId;
  final int id;
  const LearningMenuDrawer({Key? key, required this.id, this.courseId})
      : super(key: key);

  @override
  State<LearningMenuDrawer> createState() => _LearningMenuDrawerState();
}

class _LearningMenuDrawerState extends State<LearningMenuDrawer> {
  @override
  void initState() {
    Provider.of<ProfileViewModel>(context, listen: false)
        .getEnrolledById(widget.courseId!.id!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var section = Provider.of<ProfileViewModel>(context);
    return Drawer(
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.separated(
                itemCount:
                    section.enrolledCourseData.course?.sections?.length ?? 0,
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(section.enrolledCourseData.course!.sections![index]
                          .sectionName!),
                      const SizedBox(height: 8),
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: section.enrolledCourseData.course
                                ?.sections?[index].materials?.length ??
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
                            leading: section
                                        .enrolledCourseData
                                        .course!
                                        .sections![index]
                                        .materials![subIndex]
                                        .materialType ==
                                    'slide'
                                ? const Icon(Icons.slideshow_rounded)
                                : section
                                            .enrolledCourseData
                                            .course!
                                            .sections![index]
                                            .materials![subIndex]
                                            .materialType ==
                                        'quiz'
                                    ? const Icon(Icons.history_edu_rounded)
                                    : const Icon(
                                        Icons.play_circle_filled_rounded),
                            title: Text(
                              section
                                  .enrolledCourseData
                                  .course!
                                  .sections![index]
                                  .materials![subIndex]
                                  .materialName!,
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
