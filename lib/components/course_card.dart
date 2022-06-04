import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 120,
      child: Card(
        elevation: 1,
        child: Row(
          children: [
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  'https://picsum.photos/id/17/200/300',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 80,
                        height: 25,
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(5)),
                        child: const Text(
                          'Category',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                        child: const Icon(Icons.bookmark_outline),
                      )
                    ],
                  ),
                  const Text(
                    'Membuat Landing Page',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      ChipIcon(icon: Icons.timer, teks: '1h4m'),
                      ChipIcon(icon: Icons.videocam_outlined, teks: '8 Vide'),
                      ChipIcon(icon: Icons.star, teks: '4.6'),
                    ],
                  ),
                  const SizedBox(height: 1),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChipIcon extends StatelessWidget {
  IconData icon;
  String teks;
  ChipIcon({Key? key, required this.icon, required this.teks})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
        padding: const EdgeInsets.symmetric(vertical: 3),
        width: 50,
        height: 30,
        decoration: BoxDecoration(
            color: const Color(0xFFc8dad8),
            borderRadius: BorderRadius.circular(5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(icon),
            Text(teks),
          ],
        ),
      ),
    );
  }
}
