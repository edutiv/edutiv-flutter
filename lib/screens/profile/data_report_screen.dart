import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:provider/provider.dart';

import '../../model/course/enrolled_course_model.dart';
import '../../model/profile/profile_viewmodel.dart';

class DataReportScreen extends StatelessWidget {
  const DataReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final enrolledCourse = Provider.of<ProfileViewModel>(context);
    return Scaffold(
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
        iconTheme: const IconThemeData(color: Color(0xFF126E64)),
        titleTextStyle: const TextStyle(color: Colors.black),
        centerTitle: true,
        title: const Text(
          'Data Report',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: CircleAvatar(
              backgroundColor: const Color.fromARGB(62, 158, 158, 158),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.info_rounded, color: Color(0xFF126E64)),
              ),
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<EnrolledCourseModel>>(
        future: enrolledCourse.getEnrolledCourse(),
        builder: (context, snapshot) {
          return ListView.separated(
            padding: const EdgeInsets.only(top: 12),
            itemCount: snapshot.data?.length ?? 0,
            separatorBuilder: (context, index) => const SizedBox(height: 20),
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(snapshot.data?[index].course?.courseName ?? ''),
                trailing: IconButton(
                  onPressed: () async {
                    // openFile(
                    //   url: snapshot.data!.toString(),
                    //   fileName:
                    //       '${snapshot.data?[index].course?.courseName}.pdf',
                    // );
                    await enrolledCourse
                        .getDataReport(snapshot.data![index].id!);
                    OpenFile.open(enrolledCourse.reportData.path);
                  },
                  icon: const Icon(Icons.download_for_offline_rounded),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
