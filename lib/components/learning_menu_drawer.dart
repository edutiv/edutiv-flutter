import 'package:flutter/material.dart';

import '../model/course/course_model.dart';

class LearningMenuDrawer extends StatelessWidget {
  const LearningMenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final courseDetail =
        ModalRoute.of(context)!.settings.arguments as CourseModel;
    return Drawer(
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.separated(
              itemCount: 2,
              // courseDetail.section!.length,
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return const SizedBox(height: 16);
              },
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(courseDetail.section![index].sectionName!),
                    const SizedBox(height: 8),
                    ListView.separated(
                      shrinkWrap: true,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 8),
                      itemCount: 2,
                      // courseDetail.section![index].material!.length,
                      itemBuilder: (context, subIndex) {
                        return CheckboxListTile(
                          tileColor: Colors.grey[200],
                          value: false,
                          onChanged: (isCompleted) {
                            // setState(() {});
                          },
                          controlAffinity: ListTileControlAffinity.trailing,
                          title: const Text(''),
                          // courseDetail.section![index].material![subIndex].materialName!
                          secondary:
                              const Icon(Icons.play_circle_fill_outlined),
                        );
                      },
                    )
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
