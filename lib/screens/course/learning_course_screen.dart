import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  @override
  void didChangeDependencies() {
    final courseDetail =
        ModalRoute.of(context)!.settings.arguments as CourseModel;
    Provider.of<CourseViewModel>(context, listen: false)
        .getCourseById(courseDetail.id);
    super.didChangeDependencies();
  }

  int sectionIndex = 0;
  int materialIndex = 0;
  // final videoPlayerController = VideoPlayerController.network(
  //   'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
  // );

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<CourseViewModel>(context);

    // void nextVideo() {
    //   if (materialIndex == materialLength - 1) {
    //     setState(() {
    //       sectionIndex++;
    //       materialIndex = 0;
    //     });
    //   } else if (sectionIndex == sectionLength - 1 &&
    //       materialIndex == materialLength - 1) {
    //     setState(() {
    //       // isDisabled = true;
    //     });
    //   } else {
    //     setState(() {
    //       materialIndex++;
    //     });
    //   }
    // }

    // void prevVideo() {
    //   setState(() {
    //     materialIndex--;
    //   });
    // }
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
                child: null
                // YoutubePlayer(controller: youtubePlayerController),
                // Chewie(
                //   controller: ChewieController(
                //     videoPlayerController: VideoPlayerController.network(
                //         courseData.allMaterials[materialIndex].url!),
                //     autoPlay: true,
                //     allowFullScreen: true,
                //   ),
                // ),
                ),
            const SizedBox(height: 16),
            Row(
              children: const [
                Text(
                  'videoTitle!',
                  style: TextStyle(
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
                      // prevVideo();
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
                      // nextVideo();
                      // Navigator.pushNamed(context, '/successCourse');
                    },
                    // isDisabled ? null : nextVideo,
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
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: data.courseData.tools!.length,
                itemBuilder: (context, index) {
                  return ToolsCard(
                    toolsName: data.courseData.tools![index].toolsName,
                    imgUrl: data.courseData.tools![index].toolsIcon,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
