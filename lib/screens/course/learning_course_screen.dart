import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../components/learning_menu_drawer.dart';
import '../../components/tools_card.dart';
import '../../model/course/course_model.dart';
import '../../model/course/course_viewmodel.dart';

class LearningCourseScreen extends StatefulWidget {
  const LearningCourseScreen({Key? key}) : super(key: key);

  @override
  State<LearningCourseScreen> createState() => _LearningCourseScreenState();
}

class _LearningCourseScreenState extends State<LearningCourseScreen> {
  int sectionIndex = 0;
  int materialIndex = 0;
  late YoutubePlayerController ytController;

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      final courseDetail =
          ModalRoute.of(context)!.settings.arguments as CourseModel;
      Provider.of<CourseViewModel>(context, listen: false)
          .getCourseById(courseDetail.id);
      var vid = Provider.of<CourseViewModel>(context, listen: false).courseData;
      String url = vid.sections![sectionIndex].materials![materialIndex].url!;
      ytController = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(url)!,
        // flags: const YoutubePlayerFlags(autoPlay: false),
      );
    });

    super.initState();
  }

  // @override
  // void didChangeDependencies() {
  //   final courseDetail =
  //       ModalRoute.of(context)!.settings.arguments as CourseModel;
  //   Provider.of<CourseViewModel>(context).getCourseById(courseDetail.id);
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<CourseViewModel>(context);

    int materialLength =
        data.courseData.sections![sectionIndex].materials!.length;
    int sectionLength = data.courseData.sections!.length;
    String url =
        data.courseData.sections![sectionIndex].materials![materialIndex].url!;

    void nextVideo() {
      setState(() {
        materialIndex++;
      });
      ytController.load(YoutubePlayer.convertUrlToId(url)!);
      // if (materialIndex == materialLength) {
      //   setState(() {
      //     materialIndex = 0;
      //     sectionIndex++;
      //     ytController.load(
      //         YoutubePlayer.convertUrlToId(url.replaceAll(r'/embed/', '/'))!);
      //   });
      // } else if (sectionIndex == sectionLength &&
      //     materialIndex == materialLength) {
      //   setState(() {});
      // } else {
      //   setState(() {
      //     materialIndex++;
      //     ytController.load(YoutubePlayer.convertUrlToId(url)!);
      //   });
      // }
    }

    void prevVideo() {
      setState(() {
        materialIndex--;
        ytController.load(YoutubePlayer.convertUrlToId(url)!);
      });
    }

    return Scaffold(
      endDrawer: const LearningMenuDrawer(),
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
          data.courseData.courseName!,
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
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 200,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: YoutubePlayer(
                controller: ytController,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text(
                  data.courseData.sections![sectionIndex]
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
                      // Navigator.pushNamed(context, '/successCourse');
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
                      // Navigator.pushNamed(context, '/successCourse');
                    },
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              height: 290,
              child: Consumer<CourseViewModel>(builder: (context, data, child) {
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
              }),
            )
          ],
        ),
      ),
    );
  }
}
