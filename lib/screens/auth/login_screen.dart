import 'package:edutiv/components/logo.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

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

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
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
                      onPressed: () =>
                          Navigator.pushReplacementNamed(context, '/mainpage'),
                      child: const Text('LOGIN'),
                    ),
                  ),
                ),
              ],
            ),
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
      height: 260,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/login_hero.png',
            width: 200,
            height: 190,
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
