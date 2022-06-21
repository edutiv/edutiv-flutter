import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class FormRequestScreen extends StatefulWidget {
  const FormRequestScreen({Key? key}) : super(key: key);

  @override
  State<FormRequestScreen> createState() => _FormRequestScreenState();
}

class _FormRequestScreenState extends State<FormRequestScreen> {
  var formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'New Request',
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
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Email'),
                  TextFormField(
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
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: const [
                      Expanded(child: Text('First Name')),
                      Expanded(child: Text('Last Name')),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                            hintText: 'Enter your first name',
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                            hintText: 'Enter your last name',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  const Text('Title'),
                  TextFormField(
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
                      hintText: 'ex. Master Prototype Figma',
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Text('Categories'),
                  DropdownButtonFormField(
                    items: const [],
                    onChanged: null,
                    hint: const Text('Choose categories'),
                  ),
                  const SizedBox(height: 14),
                  const Text('Type Request'),
                  DropdownButtonFormField(
                    items: const [],
                    onChanged: null,
                    hint: const Text('Choose type request'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () =>
                        Navigator.pushReplacementNamed(context, '/mainpage'),
                    child: const Text('SUBMIT REQUEST'),
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
