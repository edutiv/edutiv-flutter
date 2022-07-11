import 'package:edutiv/model/course/course_viewmodel.dart';
import 'package:edutiv/screens/screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model/auth/auth_viewmodel.dart';
import 'model/profile/profile_viewmodel.dart';
import 'model/wishlist/wishlist_viewmodel.dart';

void main() {
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => CourseViewModel()),
        ChangeNotifierProvider(create: (_) => WishlistViewModel()),
        ChangeNotifierProvider(create: (_) => ProfileViewModel()),
      ],
      child: MaterialApp(
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
          '/mainpage': (context) => MainPage(),
          '/homeScreen': (context) => const HomeScreen(),
          '/courseScreen': (context) => const CourseScreen(),
          '/myCourse': (context) => const MyCourseScreen(),
          '/detailCourse': (context) => const DetailCourseScreen(),
          '/learningCourse': (context) => const LearningCourseScreen(),
          '/successCourse': (context) => const SuccessCourseScreen(),
          '/profile': (context) => const ProfileScreen(),
          '/editProfile': (context) => const EditProfileScreen(),
          '/faq': (context) => const FAQScreen(),
          '/formRequest': (context) => const FormRequestScreen(),
          '/certificate': (context) => const CertificateScreen(),
          '/certificateDetail': (context) => const CertificateDetailScreen(),
          '/search': (context) => const SearchScreen(),
        },
      ),
    );
  }
}
