import 'package:flutter/material.dart';

class TeksBanner extends StatelessWidget {
  String? title;
  String? desc;

  TeksBanner({Key? key, this.title, this.desc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title!,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'See all',
                  style: TextStyle(color: Color(0xFF126E64)),
                ),
              ),
            ],
          ),
          Text(desc!),
        ],
      ),
    );
  }
}
