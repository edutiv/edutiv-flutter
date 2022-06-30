import 'package:flutter/material.dart';

class FAQ {
  String? title;
  String? desc;
  bool isExpanded;
  FAQ({this.title, this.desc, this.isExpanded = false});
}

class FAQScreen extends StatefulWidget {
  const FAQScreen({Key? key}) : super(key: key);

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  List<FAQ> faq = [
    FAQ(title: 'Faq 1', desc: 'Ini faq nomor 1'),
    FAQ(title: 'Faq 2', desc: 'Ini faq nomor 2'),
    FAQ(title: 'Faq 3', desc: 'Ini faq nomor 3'),
    FAQ(title: 'Faq 4', desc: 'Ini faq nomor 4'),
    FAQ(title: 'Faq 5', desc: 'Ini faq nomor 5'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          dividerColor: Colors.transparent,
          elevation: 0,
          expansionCallback: (index, isExpanded) {
            setState(() {
              faq[index].isExpanded = !isExpanded;
            });
          },
          children: faq
              .map(
                (item) => ExpansionPanel(
                  canTapOnHeader: true,
                  isExpanded: item.isExpanded,
                  headerBuilder: (context, isExpanded) => ListTile(
                    title: Text(item.title!),
                  ),
                  body: ListTile(
                    title: Text(item.desc!),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
