import 'package:flutter/material.dart';

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
            Container(
              color: Colors.blueGrey,
              width: 250,
              height: 180,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.close_rounded, color: Colors.white),
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  onPressed: () {},
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
