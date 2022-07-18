import 'package:edutiv/api/download.dart';
import 'package:flutter/material.dart';
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
          if (snapshot.hasData) {
            return ListView.separated(
              padding: const EdgeInsets.only(top: 12),
              itemCount: snapshot.data?.length ?? 0,
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data?[index].course?.courseName ?? ''),
                  trailing: IconButton(
                    onPressed: () async {
                      await open(
                        snapshot.data![index].id!,
                        '${snapshot.data?[index].course?.courseName} Report.pdf',
                      );
                    },
                    icon: const Icon(Icons.download_for_offline_rounded),
                  ),
                );
              },
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return const Center(
            child: Text('Kamu Belum Mengambil Course!'),
          );
        },
      ),
    );
  }
}
