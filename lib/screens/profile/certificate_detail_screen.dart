import 'package:edutiv/api/certificate_api.dart';
import 'package:edutiv/model/course/enrolled_course_model.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';

import '../../components/data.dart';

class CertificateDetailScreen extends StatelessWidget {
  const CertificateDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)!.settings.arguments as EnrolledCourseModel;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              data.course!.courseName!,
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              width: 250,
              height: 180,
              child: Image.asset('assets/edutiv_certificate_preview_dummy.jpg'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close_rounded, color: Colors.white),
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  onPressed: () async {
                    final certificateFile = await CertificateAPI.generate(
                      PdfPageFormat.a4,
                      CustomData(
                        name:
                            '${data.user!.firstname!.toUpperCase()} ${data.user!.lastname!.toUpperCase()}',
                        courseName: data.course!.courseName,
                      ),
                    );
                    CertificateAPI.openFile(certificateFile);
                  },
                  icon: Icon(
                    Icons.file_download_sharp,
                    color: Theme.of(context).primaryColor,
                  ),
                  label: Text(
                    'DOWNLOAD CERTIFICATE',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
