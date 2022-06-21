import 'package:flutter/material.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({Key? key}) : super(key: key);

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  bool isExpanded = false;

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
          'FAQs',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: CircleAvatar(
              backgroundColor: const Color.fromARGB(62, 158, 158, 158),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert, color: Color(0xFF126E64)),
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ExpansionTile(
            expandedAlignment: Alignment.centerLeft,
            childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            textColor: Theme.of(context).primaryColor,
            iconColor: Theme.of(context).primaryColor,
            title: const Text('Sorem Ipsum Dolor sit Amet'),
            trailing:
                isExpanded ? const Icon(Icons.remove) : const Icon(Icons.add),
            onExpansionChanged: (bool expanded) {
              setState(() {
                isExpanded = expanded;
              });
            },
            children: const [
              Text('Sjhfdkjsdjkshfkjhskdhfshfkshfkhskdhfksdhjk')
            ],
          );
        },
      ),
    );
  }
}
