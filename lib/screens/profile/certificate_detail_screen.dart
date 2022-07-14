import 'package:edutiv/api/certificate_api.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';

import '../../components/data.dart';

class CertificateDetailScreen extends StatelessWidget {
  const CertificateDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'Mastering Front-End Development with React JS',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              width: 250,
              height: 180,
              child: Image.asset('assets/certif_dummy.png'),
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
                        name: 'Bro',
                        courseName: 'Become a Flutter Master From Zero to Hero',
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
