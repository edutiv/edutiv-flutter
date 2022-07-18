import 'package:edutiv/model/profile/profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({Key? key}) : super(key: key);

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  @override
  void initState() {
    Provider.of<ProfileViewModel>(context, listen: false).getAllFAQ();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final faq = Provider.of<ProfileViewModel>(context);
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
              faq.allFAQ[index].isExpanded = !isExpanded;
            });
          },
          children: faq.allFAQ
              .map(
                (item) => ExpansionPanel(
                  canTapOnHeader: true,
                  isExpanded: item.isExpanded ?? false,
                  headerBuilder: (context, isExpanded) => ListTile(
                    title: Text(item.question!),
                  ),
                  body: ListTile(
                    subtitle: Text(item.answer!),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
