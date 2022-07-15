import 'package:edutiv/model/course/enrolled_course_model.dart';
import 'package:edutiv/model/profile/profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CertificateScreen extends StatefulWidget {
  const CertificateScreen({Key? key}) : super(key: key);

  @override
  State<CertificateScreen> createState() => _CertificateScreenState();
}

class _CertificateScreenState extends State<CertificateScreen> {
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
          'Certificate',
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
        future: enrolledCourse.getFinishedCourse(),
        builder: (context, snapshot) {
          return ListView.separated(
            padding: const EdgeInsets.only(top: 12),
            itemCount: snapshot.data?.length ?? 0,
            separatorBuilder: (context, index) => const SizedBox(height: 20),
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () => Navigator.pushNamed(
                  context,
                  '/certificateDetail',
                  arguments: snapshot.data?[index],
                ),
                leading: Image.asset(
                  'assets/edutiv_certificate_preview_dummy.jpg',
                  height: 100,
                ),
                title: Text(snapshot.data?[index].course?.courseName ?? ''),
                trailing: const Icon(Icons.chevron_right_outlined),
              );
            },
          );
        },
      ),
    );
  }
}
