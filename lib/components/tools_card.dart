import 'package:flutter/material.dart';

class ToolsCard extends StatelessWidget {
  String? toolsName;
  String? imgUrl;
  ToolsCard({Key? key, this.toolsName, this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Expanded(
            child: Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(height: 8),
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage(imgUrl!),
                    ),
                    const SizedBox(height: 8),
                    Text(toolsName!),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.download,
                        color: Colors.black,
                        size: 14,
                      ),
                      label: const Text(
                        'Download',
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
