import 'package:edutiv/components/logo.dart';
import 'package:edutiv/model/profile/profile_viewmodel.dart';
import 'package:edutiv/screens/homescreen/main_page.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../model/auth/auth_viewmodel.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();
  bool _passwordVisible = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  late SharedPreferences loginState;
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    checkIsLoggedIn();
    _passwordVisible = false;
  }

  void checkIsLoggedIn() async {
    loginState = await SharedPreferences.getInstance();
    isLoggedIn = loginState.getBool('isLoggedIn') ?? false;

    if (isLoggedIn == true) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => MainPage(),
        ),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<AuthViewModel>(context);
    final user = Provider.of<ProfileViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Logo(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const buildLoginTextHeader(),
            Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Email'),
                  buildEmailField(emailController: emailController),
                  const SizedBox(height: 14),
                  const Text('Password'),
                  TextFormField(
                    controller: passwordController,
                    obscureText: !_passwordVisible,
                    validator: (val) {
                      if (val != null && val.length < 4) {
                        return 'Masukkan Minimal 4 Karakter';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      hintText: 'Enter your password',
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                        icon: Icon(_passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, '/forgetPassword'),
                  child: const Text(
                    'Forget password?',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () async {
                        final isValidForm = formKey.currentState!.validate();
                        if (isValidForm) {
                          await data.login(
                            emailController.text,
                            passwordController.text,
                          );
                          final prefs = await SharedPreferences.getInstance();
                          await data.saveToken(data.loginTokenData.token!);
                          Map<String, dynamic> decodedToken = JwtDecoder.decode(
                              prefs.getString('token').toString());
                          await data.saveLoginData(decodedToken);
                          await user.getWhoLogin();
                          await prefs.setBool('isLoggedIn', true);
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MainPage(
                                id: int.tryParse(data.loginData.jti!),
                              ),
                            ),
                            (route) => false,
                          );
                        } else {
                          return;
                        }
                      },
                      child: const Text('LOGIN'),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t have an account?'),
                TextButton(
                  onPressed: () {
                    String? encodeQueryParameters(Map<String, String> params) {
                      return params.entries
                          .map((e) =>
                              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                          .join('&');
                    }

                    final Uri emailLaunchUri = Uri(
                      scheme: 'mailto',
                      path: 'online@edutiv.com',
                      query: encodeQueryParameters(
                          <String, String>{'subject': 'Request an Account'}),
                    );

                    launchUrl(emailLaunchUri);
                  },
                  child: const Text(
                    'Contact admin',
                    style: TextStyle(color: Color(0xFF126E64)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class buildLoginTextHeader extends StatelessWidget {
  const buildLoginTextHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 32),
      height: 230,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/login_hero.png',
            width: 200,
            height: 160,
          ),
          const Text(
            'Welcome Back',
            style: TextStyle(fontSize: 28),
          ),
          const Text(
            'Please login with your account to continue',
            style: TextStyle(fontSize: 13, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class buildEmailField extends StatelessWidget {
  const buildEmailField({
    Key? key,
    required this.emailController,
  }) : super(key: key);

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      validator: (email) {
        if (email != null && !EmailValidator.validate(email)) {
          return 'Masukkan email dengan benar';
        } else {
          return null;
        }
      },
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        hintText: 'Enter your email',
      ),
    );
  }
}
