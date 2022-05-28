import 'package:flutter/material.dart';

class PasswordResetSuccessScreen extends StatefulWidget {
  const PasswordResetSuccessScreen({Key? key}) : super(key: key);

  @override
  State<PasswordResetSuccessScreen> createState() =>
      _PasswordResetSuccessScreenState();
}

class _PasswordResetSuccessScreenState
    extends State<PasswordResetSuccessScreen> {
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
              child: Image.asset('assets/checklist_icon.png',
                  width: 48, height: 48),
            ),
            const Center(
                child: Text(
              'Reset Password',
              style: TextStyle(fontSize: 28),
            )),
            const Center(
                child: Text(
              'Your password has been successfully reset.',
              style: TextStyle(fontSize: 13, color: Colors.grey),
            )),
            const Center(
                child: Text(
              'Click below to login magically',
              style: TextStyle(fontSize: 13, color: Colors.grey),
            )),
            const SizedBox(height: 8),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Continue'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
