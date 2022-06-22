import 'package:edutiv/model/course/materials_model.dart';
import 'package:edutiv/model/course/section_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/course/course_model.dart';
import '../model/course/course_viewmodel.dart';

class LearningMenuDrawer extends StatefulWidget {
  const LearningMenuDrawer({Key? key}) : super(key: key);

  @override
  State<LearningMenuDrawer> createState() => _LearningMenuDrawerState();
}

class _LearningMenuDrawerState extends State<LearningMenuDrawer> {
  @override
  Widget build(BuildContext context) {
    final courseDetail =
        ModalRoute.of(context)!.settings.arguments as CourseModel;
    var section = Provider.of<CourseViewModel>(context, listen: false);
    return Drawer(
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: FutureBuilder<List<Section>>(
                future: section.getAllSectionFromCourseId(courseDetail.id),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    return ListView.separated(
                      itemCount: snapshot.data!.length,
                      shrinkWrap: true,
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 16);
                      },
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(snapshot.data![index].sectionName!),
                            const SizedBox(height: 8),
                            FutureBuilder<List<Materials>>(
                              future: section.getAllMaterialsFromSectionId(
                                  courseDetail.id,
                                  section.allSection[index].id),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                } else if (snapshot.connectionState ==
                                        ConnectionState.done &&
                                    snapshot.hasData) {
                                  return ListView.separated(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(height: 8),
                                    itemCount: snapshot.data!.length,
                                    itemBuilder: (context, subIndex) {
                                      return CheckboxListTile(
                                        tileColor: Colors.grey[200],
                                        value: false,
                                        onChanged: (isCompleted) {},
                                        controlAffinity:
                                            ListTileControlAffinity.trailing,
                                        title: Text(
                                          snapshot
                                              .data![subIndex].materialName!,
                                        ),
                                        secondary: const Icon(
                                          Icons.play_circle_fill_outlined,
                                        ),
                                      );
                                    },
                                  );
                                } else {
                                  return const Text('Failed to Get Materials');
                                }
                              },
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    return const Text('Failed');
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
