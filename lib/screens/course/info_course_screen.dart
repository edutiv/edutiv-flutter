import 'package:flutter/material.dart';

import '../../components/review_card.dart';

class InfoCourseScreen extends StatefulWidget {
  const InfoCourseScreen({Key? key}) : super(key: key);

  @override
  State<InfoCourseScreen> createState() => _InfoCourseScreenState();
}

class _InfoCourseScreenState extends State<InfoCourseScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(250),
          child: AppBar(
            leading: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: CircleAvatar(
                backgroundColor: const Color.fromARGB(62, 158, 158, 158),
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.chevron_left_outlined,
                      color: Colors.white),
                ),
              ),
            ),
            iconTheme: const IconThemeData(color: Colors.white),
            titleTextStyle: const TextStyle(color: Colors.white),
            centerTitle: true,
            flexibleSpace: Container(
              height: 220,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/uiux_deco.jpeg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      const Color(0xFF126E64).withOpacity(1), BlendMode.darken),
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                color: const Color(0xFF258b80),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // const SizedBox(height: 50),
                    const Text(
                      'Introduction to UI/UX Designer',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.play_circle_outline_outlined,
                        color: Colors.white,
                      ),
                      label: const Text(
                        'Preview Course',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            title: const Text(
              'Details Course',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: CircleAvatar(
                  backgroundColor: const Color.fromARGB(62, 158, 158, 158),
                  child: IconButton(
                    onPressed: () {},
                    icon:
                        const Icon(Icons.bookmark_outline, color: Colors.white),
                  ),
                ),
              ),
            ],
            bottom: const TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Color(0xFF126E64),
              labelColor: Colors.black,
              tabs: [
                Tab(text: 'About'),
                Tab(text: 'Lesson'),
                Tab(text: 'Tools'),
                Tab(text: 'Reviews'),
              ],
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            AboutTabSection(),
            LessonTabSection(),
            ToolsTabSection(),
            ReviewsTabSection(),
          ],
        ),
      ),
    );
  }
}

class ReviewsTabSection extends StatelessWidget {
  const ReviewsTabSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> ilust = [
      'assets/backend_ilust.jpg',
      'assets/mobile_ilust.jpg',
      'assets/uiux_ilust.jpg',
      'assets/frontend_ilust.jpg',
    ];

    final List<String> judul = [
      'Backend Engineer',
      'Mobile Engineer',
      'UI/UX Designer',
      'Frontend Engineer',
    ];

    final List<String> subjudul = [
      'Web Developer',
      'Mobile Developer',
      'Product Designer',
      'Web Designer',
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: 4,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return ReviewCard(
                img: ilust[index],
                title: judul[index],
                desc: subjudul[index],
              );
            },
          ),
        ),
        const EnrollBottomBar()
      ],
    );
  }
}

class ToolsTabSection extends StatelessWidget {
  const ToolsTabSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: const [
                ToolsCard(),
                ToolsCard(),
                ToolsCard(),
              ],
            ),
          ),
        ),
        const EnrollBottomBar(),
      ],
    );
  }
}

class LessonTabSection extends StatefulWidget {
  const LessonTabSection({
    Key? key,
  }) : super(key: key);

  @override
  State<LessonTabSection> createState() => _LessonTabSectionState();
}

class _LessonTabSectionState extends State<LessonTabSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: 5,
            separatorBuilder: (context, index) {
              return const SizedBox(height: 8);
            },
            itemBuilder: ((context, index) {
              return ListTile(
                tileColor: Colors.grey[200],
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                leading: const Icon(Icons.play_circle_fill_outlined),
                title: const Text('Pengenalan Figma'),
              );
            }),
          ),
        ),
        const EnrollBottomBar(),
      ],
    );
  }
}

class AboutTabSection extends StatelessWidget {
  const AboutTabSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: const [
                Padding(
                  padding: EdgeInsets.all(24),
                  child: Text(
                    'The development of the current era of technology and the emergence of many opportunities introduces us to some new job names. Especially in the design industry, called User Interface (UI) and User Experience (UX) designers. This type of work is closely related to product design on Digital Platforms (Websites / Tablets / Apps) in the form of Digital Products, where UI/UX Design learning will be implemented with a product design process which of course requires research to create functional design results without compromising on beauty. a website/tablet/apps.',
                  ),
                ),
              ],
            ),
          ),
        ),
        const EnrollBottomBar(),
      ],
    );
  }
}

class ToolsCard extends StatelessWidget {
  const ToolsCard({
    Key? key,
  }) : super(key: key);

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
                    const FlutterLogo(),
                    const SizedBox(height: 8),
                    const Text('Figma'),
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

class EnrollBottomBar extends StatelessWidget {
  const EnrollBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(62, 158, 158, 158),
            blurRadius: 15,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, '/courseDetail'),
          child: const Text('ENROLL COURSE'),
        ),
      ),
    );
  }
}
