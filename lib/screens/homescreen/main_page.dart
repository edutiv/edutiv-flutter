import 'package:flutter/material.dart';

import '../screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  final screens = [
    const HomeScreen(),
    const CourseScreen(),
    const WishlistScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        // unselectedItemColor: const Color(0xFF9E9E9E),
        // showUnselectedLabels: true,
        // unselectedLabelStyle: const TextStyle(color: Colors.grey),
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        selectedItemColor: Theme.of(context).primaryColor,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_rounded), label: 'Course'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_rounded), label: 'Wishlist'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded), label: 'Profile'),
        ],
      ),
    );
  }
}
