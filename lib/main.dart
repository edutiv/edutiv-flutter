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
            textStyle: const TextStyle(),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            primary: const Color(0xFF126E64),
          ),
        ),
        checkboxTheme: CheckboxThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        fontFamily: 'Poppins',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/forgetPassword': (context) => const ForgetPasswordScreen(),
        '/confirmPasswordReset': (context) =>
            const ConfirmPasswordResetScreen(),
        '/passwordReset': (context) => const PasswordResetScreen(),
        '/passwordResetSuccess': (context) =>
            const PasswordResetSuccessScreen(),
        '/mainpage': (context) => const MainPage(),
        '/homeScreen': (context) => const HomeScreen(),
        '/myCourse': (context) => const MyCourseScreen(),
        '/courseDetail': (context) => const CourseDetailScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/search': (context) => const SearchScreen(),
      },
    );
  }
}
