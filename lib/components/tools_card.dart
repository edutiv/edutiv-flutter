import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ToolsCard extends StatelessWidget {
  String? toolsName;
  String? imgUrl;
  String? toolUrl;
  ToolsCard({Key? key, this.toolsName, this.imgUrl, this.toolUrl})
      : super(key: key);

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
                      onPressed: () async {
                        if (await canLaunchUrl(Uri.parse(toolUrl ?? ''))) {
                          await launchUrl(Uri.parse(toolUrl ?? ''));
                        }
                      },
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
