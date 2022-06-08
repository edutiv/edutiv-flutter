import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../components/logo.dart';

class CourseDetailScreen extends StatefulWidget {
  const CourseDetailScreen({Key? key}) : super(key: key);

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
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
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Logo(),
        actions: const [],
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
                            onPressed: () {},
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
              title: Text('Pengenalan Bootstrap'),
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
              title: const Text('Pengenalan Bootstrap'),
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
