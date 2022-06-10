import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  String courseImage;
  String courseName;
  String mentorName;
  String totalVideo;
  String totalTime;
  int rating;

  CourseCard(
      {Key? key,
      required this.courseImage,
      required this.courseName,
      required this.mentorName,
      required this.rating,
      required this.totalTime,
      required this.totalVideo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 116,
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.blue,
              ),
              child: Stack(
                alignment: Alignment.center,
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(
                      courseImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    left: 8,
                    top: 8,
                    child: Container(
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      width: 36,
                      height: 18,
                      child: FittedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(Icons.star,
                                color: Colors.amber, size: 16),
                            Text('$rating'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              width: 100,
              height: 100,
              // color: Colors.amber,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    courseName,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CircleAvatar(radius: 8),
                      const SizedBox(width: 8),
                      Text(mentorName),
                    ],
                  ),
                  Row(
                    children: [
                      GreenChipWidget(
                        icon: Icons.timelapse,
                        label: totalTime,
                      ),
                      const SizedBox(width: 8),
                      GreenChipWidget(
                        icon: Icons.videocam,
                        label: '$totalVideo Video',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GreenChipWidget extends StatelessWidget {
  GreenChipWidget({Key? key, required this.icon, required this.label})
      : super(key: key);

  IconData icon;
  String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color(0xFFC3CFCE),
      ),
      width: 74,
      height: 20,
      child: FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon, color: Theme.of(context).primaryColor, size: 16),
            Text(label),
          ],
        ),
      ),
    );
  }
}
