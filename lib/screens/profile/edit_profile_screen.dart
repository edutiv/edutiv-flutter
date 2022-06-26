import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
            'Edit Profile',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: CircleAvatar(
                backgroundColor: const Color.fromARGB(62, 158, 158, 158),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert_rounded,
                      color: Color(0xFF126E64)),
                ),
              ),
            ),
          ],
          bottom: const TabBar(
            indicatorColor: Color(0xFF126E64),
            labelColor: Colors.black,
            tabs: [
              Tab(text: 'Identity'),
              Tab(text: 'Change Password'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            EditIdentityScreen(),
            ChangePasswordOnEditProfileScreen(),
          ],
        ),
      ),
    );
  }
}

class EditIdentityScreen extends StatelessWidget {
  const EditIdentityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController;
    return Form(
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Profile Picture'),
                  Row(
                    children: [
                      const CircleAvatar(),
                      TextButton(
                          onPressed: () {}, child: const Text('UPLOAD PHOTO')),
                    ],
                  ),
                  const Text(
                      'It is recommended that your profile photo has a ratio of 1: 1 or not more than 2MB in size and the file format is jpg, jpeg, png.'),
                  const SizedBox(height: 16),
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
                  const SizedBox(height: 16),
                  const Text('Email'),
                  TextFormField(
                    controller: null,
                    // emailController,
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
                  const SizedBox(height: 16),
                  const Text('Specialization'),
                  DropdownButtonFormField(
                    items: const [],
                    onChanged: null,
                    hint: const Text('UI/UX Designer'),
                  ),
                ],
              ),
            ),
          ),
          const SaveBottomBar()
        ],
      ),
    );
  }
}

class ChangePasswordOnEditProfileScreen extends StatefulWidget {
  const ChangePasswordOnEditProfileScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordOnEditProfileScreen> createState() =>
      _ChangePasswordOnEditProfileScreenState();
}

class _ChangePasswordOnEditProfileScreenState
    extends State<ChangePasswordOnEditProfileScreen> {
  bool _passwordVisible = true;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Old Password'),
                      TextFormField(
                        obscureText: !_passwordVisible,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          hintText: 'Enter your old password',
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
                      const Text('Password'),
                      TextFormField(
                        obscureText: !_passwordVisible,
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
                      const SizedBox(height: 8),
                      const Text('Confirm Password'),
                      TextFormField(
                        obscureText: !_passwordVisible,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          hintText: 'Enter the same password',
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
              ],
            ),
          ),
        ),
        const SaveBottomBar()
      ],
    );
  }
}

class SaveBottomBar extends StatelessWidget {
  const SaveBottomBar({
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
          onPressed: () => Navigator.pushNamed(
            context,
            '/learningCourse',
          ),
          child: const Text('SAVE CHANGES'),
        ),
      ),
    );
  }
}
