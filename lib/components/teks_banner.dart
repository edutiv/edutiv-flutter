import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/course/course_viewmodel.dart';
import '../screens/homescreen/main_page.dart';

class TeksBanner extends StatelessWidget {
  String? title;

  TeksBanner({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var edutiv = Provider.of<CourseViewModel>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title!,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            TextButton(
              onPressed: () async {
                // final prefs = await SharedPreferences.getInstance();
                // Map<String, dynamic> decodedToken =
                //     JwtDecoder.decode(prefs.getString('token').toString());
                // print(decodedToken);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainPage(index: 1),
                  ),
                );
              },
              child: const Text(
                'See all',
                style: TextStyle(color: Color(0xFF126E64)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
