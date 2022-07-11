import 'package:flutter/material.dart';

class CourseProgressCard extends StatelessWidget {
  String courseImage;
  String courseName;
  String? categoryName;
  double? rating;
  String? totalVideo;

  CourseProgressCard({
    Key? key,
    required this.courseImage,
    required this.courseName,
    this.categoryName,
    this.rating,
    this.totalVideo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isAvailable = true;
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
                      errorBuilder: (context, Object exception, stackTrace) {
                        return Image.asset(
                          'assets/empty_image.png',
                          fit: BoxFit.cover,
                        );
                      },
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
                      Text(
                        '$categoryName',
                        style: TextStyle(color: Colors.grey[500]),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      //ProgressBar
                      const Expanded(
                        child: LinearProgressIndicator(
                          value: 0.5,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Color(0xFF126E64),
                          ),
                          backgroundColor: Colors.grey,
                          // color: Color(0xFF126E64),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text('10/$totalVideo')
                    ],
                  ),
                  // const SizedBox(height: 1),
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
