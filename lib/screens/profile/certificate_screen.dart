import 'package:flutter/material.dart';

class CertificateScreen extends StatefulWidget {
  const CertificateScreen({Key? key}) : super(key: key);

  @override
  State<CertificateScreen> createState() => _CertificateScreenState();
}

class _CertificateScreenState extends State<CertificateScreen> {
  @override
  Widget build(BuildContext context) {
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
      body: ListView.separated(
        padding: const EdgeInsets.only(top: 12),
        itemCount: 3,
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(
              width: 100,
              height: 100,
              color: Colors.amberAccent,
            ),
            title: const Text('data'),
            trailing: const Icon(Icons.chevron_right_outlined),
          );
        },
      ),
    );
  }
}
