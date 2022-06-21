import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/course/course_model.dart';
import '../model/course/course_viewmodel.dart';

class LearningMenuDrawer extends StatelessWidget {
  const LearningMenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final courseDetail =
        ModalRoute.of(context)!.settings.arguments as CourseModel;
    var section = Provider.of<CourseViewModel>(context, listen: false);
    return Drawer(
      child: FutureBuilder(
        future: section.getAllSectionFromCourseId(courseDetail.id),
        builder: (context, snapshot) {
          return Container(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: section.allSection.length,
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 16);
                    },
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(section.allSection[index].sectionName!),
                          const SizedBox(height: 8),
                          FutureBuilder(
                            future: section.getAllMaterialsFromSectionId(
                                courseDetail.id, section.allSection[index].id),
                            builder: (context, snapshot) {
                              return ListView.separated(
                                shrinkWrap: true,
                                separatorBuilder: (context, index) =>
                                    const SizedBox(height: 8),
                                itemCount: section.allMaterials.length,
                                itemBuilder: (context, subIndex) {
                                  return CheckboxListTile(
                                    tileColor: Colors.grey[200],
                                    value: false,
                                    onChanged: (isCompleted) {
                                      // setState(() {});
                                    },
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                    title: Text(
                                      section
                                          .allMaterials[subIndex].materialName!,
                                    ),
                                    secondary: const Icon(
                                      Icons.play_circle_fill_outlined,
                                    ),
                                  );
                                },
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
          );
        },
      ),
    );
  }
}
