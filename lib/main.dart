import 'package:edutiv/screens/screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Edutiv',
      theme: ThemeData(
        primaryColor: const Color(0xFF126E64),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: const Color(0xFF126E64),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            textStyle: const TextStyle(),
          ),
        ),
        fontFamily: 'Poppins',
      ),
      home: const LoginScreen(),
    );
  }
}
