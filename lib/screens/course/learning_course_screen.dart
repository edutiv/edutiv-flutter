import 'package:chewie/chewie.dart';
import 'package:edutiv/components/learning_menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../components/tools_card.dart';
import '../../model/course/course_model.dart';

class LearningCourseScreen extends StatefulWidget {
  const LearningCourseScreen({Key? key}) : super(key: key);

  @override
  State<LearningCourseScreen> createState() => _LearningCourseScreenState();
}

class _LearningCourseScreenState extends State<LearningCourseScreen> {
  // @override
  // void initState() {
  //   videoPlayerController.initialize();
  //   super.initState();
  // }

  // final videoPlayerController = VideoPlayerController.network(
  //   'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
  // );

  // @override
  // void dispose() {
  //   videoPlayerController.dispose();
  //   super.dispose();
  // }
  int sectionIndex = 0;
  int materialIndex = 0;

  @override
  Widget build(BuildContext context) {
    final material = ModalRoute.of(context)!.settings.arguments as CourseModel;
    // var videoUrl = material.section?[sectionIndex].material?[materialIndex].url;
    // var videoTitle = material.section?[sectionIndex].material?[materialIndex].materialName;
    // var materialLength = material.section?[sectionIndex].material?.length;
    // var sectionLength = material.section?.length;
    bool isDisabled = false;

    // void nextVideo() {
    //   print(materialIndex);
    //   print(materialLength);
    //   if (materialIndex == materialLength! - 1) {
    //     setState(() {
    //       sectionIndex++;
    //       materialIndex = 0;
    //     });
    //   } else if (sectionIndex == sectionLength! - 1 &&
    //       materialIndex == materialLength - 1) {
    //     setState(() {
    //       isDisabled = true;
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
          material.courseName!,
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
              child: Chewie(
                controller: ChewieController(
                  videoPlayerController:
                      VideoPlayerController.network('videoUrl!'),
                  autoPlay: true,
                  allowFullScreen: true,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text(
                  'videoTitle!',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
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
                    onPressed: (){},
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
                itemCount: 2,
                // material.tools?.length,
                itemBuilder: (context, index) {
                  return ToolsCard(
                    toolsName: '',
                    // material.tools![index].toolsName!,
                    imgUrl: '',
                    // material.tools?[index].toolsIcon,
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
