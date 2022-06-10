import 'package:flutter/material.dart';

class LearningMenuDrawer extends StatelessWidget {
  const LearningMenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: const EdgeInsets.all(12),
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          itemCount: 15,
          itemBuilder: (context, index) {
            return CheckboxListTile(
              tileColor: Colors.grey[200],
              value: false,
              onChanged: (isChecked) {
                // setState(() {});
              },
              controlAffinity: ListTileControlAffinity.trailing,
              title: const Text('Pengenalan Figma'),
              secondary: const Icon(Icons.play_circle_fill_outlined),
            );
          },
        ),
      ),
    );
  }
}
