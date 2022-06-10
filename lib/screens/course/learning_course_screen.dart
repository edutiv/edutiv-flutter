import 'package:chewie/chewie.dart';
import 'package:edutiv/components/learning_menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class LearningCourseScreen extends StatefulWidget {
  const LearningCourseScreen({Key? key}) : super(key: key);

  @override
  State<LearningCourseScreen> createState() => _LearningCourseScreenState();
}

class _LearningCourseScreenState extends State<LearningCourseScreen> {
  final videoPlayerController = VideoPlayerController.network(
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
  );

  @override
  void initState() {
    videoPlayerController.initialize();
    super.initState();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        title: const Text(
          'Introduction to UI/UX Designer',
          style: TextStyle(color: Colors.black, fontSize: 14),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 200,
              child: Chewie(
                controller: ChewieController(
                  videoPlayerController: videoPlayerController,
                  autoPlay: true,
                  allowFullScreen: true,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'TITLE',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('Description'),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          OutlinedButton(
                            onPressed: () {},
                            child: const Text('Previous'),
                          ),
                          const SizedBox(width: 16),
                          ElevatedButton(
                            onPressed: () =>
                                Navigator.pushNamed(context, '/successCourse'),
                            child: const Text('Next Video'),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text('Preparation'),
            ),
            const ListTile(
              leading: Icon(Icons.download_outlined),
              title: Text('Pengenalan Figma'),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text('Video Course'),
            ),
            //WILL REPLACED BY LISTVIEW.BUILDER LATER
            CheckboxListTile(
              value: false,
              onChanged: (isChecked) {
                setState(() {});
              },
              controlAffinity: ListTileControlAffinity.trailing,
              title: const Text('Pengenalan Figma'),
              secondary: const Icon(Icons.play_circle_fill_outlined),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text('Closing'),
            ),
            const ListTile(
              leading: Icon(Icons.download_outlined),
              title: Text('Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
