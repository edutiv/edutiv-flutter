import 'package:flutter/material.dart';

class ConfirmPasswordResetScreen extends StatefulWidget {
  const ConfirmPasswordResetScreen({Key? key}) : super(key: key);

  @override
  State<ConfirmPasswordResetScreen> createState() =>
      _ConfirmPasswordResetScreenState();
}

class _ConfirmPasswordResetScreenState
    extends State<ConfirmPasswordResetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        minimum: const EdgeInsets.fromLTRB(27, 0, 27, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Edutiv.',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),
            ),
            Center(
              child:
                  Image.asset('assets/email_icon.png', width: 48, height: 48),
            ),
            const Center(
                child: Text(
              'Check Your Email',
              style: TextStyle(fontSize: 28),
            )),
            const Center(
                child: Text(
              'We sent a password reset link to',
              style: TextStyle(fontSize: 13, color: Colors.grey),
            )),
            const Center(
                child: Text(
              'admin@gmail.com',
              style: TextStyle(fontSize: 13, color: Colors.grey),
            )),
            const SizedBox(height: 8),
            Center(
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/passwordReset'),
                child: const Text('OPEN EMAIL APP'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t receive the email?'),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Resend again',
                    style: TextStyle(color: Theme.of(context).primaryColor),
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
