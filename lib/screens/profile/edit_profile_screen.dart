import 'dart:io';

import 'package:edutiv/api/user_api.dart';
import 'package:email_validator/email_validator.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/profile/profile_viewmodel.dart';

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

class EditIdentityScreen extends StatefulWidget {
  const EditIdentityScreen({Key? key}) : super(key: key);

  @override
  State<EditIdentityScreen> createState() => _EditIdentityScreenState();
}

class _EditIdentityScreenState extends State<EditIdentityScreen> {
  var formKey = GlobalKey<FormState>();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  String? selectedCat = 'Backend Engineer';

  // List<String> category = [
  //   'Backend Engineer', //1
  //   'Frontend Engineer', //2
  //   'Mobile Engineer', //3
  //   'UI/UX Designer' //4
  // ];

  Map<String, int> specialization = {
    'Backend Engineer': 1,
    'Frontend Engineer': 2,
    'Mobile Engineer': 3,
    'UI/UX Designer': 4
  };

  File pp = File('assets/default_pp.png');

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<ProfileViewModel>(context);
    String firstname = user.userData.firstname!;
    String lastname = user.userData.lastname!;
    var email = user.userData.email!;
    int specializationId = user.userData.specialization!.id;

    return Form(
      key: formKey,
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
                      CircleAvatar(
                        backgroundImage: Image.file(pp).image,
                      ),
                      TextButton(
                        onPressed: () async {
                          FilePickerResult? result = await FilePicker.platform
                              .pickFiles(type: FileType.image);

                          if (result != null) {
                            File file = File(result.files.single.path!);
                            setState(() {
                              pp = File(file.path);
                            });
                          } else {}
                        },
                        child: const Text(
                          'UPLOAD PHOTO',
                          style: TextStyle(color: Color(0xFF126E64)),
                        ),
                      ),
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
                          // controller: firstnameController,
                          initialValue: user.userData.firstname,
                          onChanged: (val) {
                            firstnameController.text = val;
                            firstname = val;
                          },
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
                          // controller: lastnameController,
                          initialValue: user.userData.lastname,
                          onChanged: (val) {
                            lastnameController.text = val;
                            lastname = val;
                          },
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
                    // controller: emailController,
                    initialValue: user.userData.email,
                    onChanged: (val) {
                      emailController.text = val;
                      email = val;
                    },
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
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                    ),
                    value: user.userData.specialization!.categoryName,
                    items: specialization.entries
                        .map(
                          (e) => DropdownMenuItem<String>(
                            value: e.key,
                            child: Text(e.key),
                          ),
                        )
                        .toList(),
                    // category
                    //     .map(
                    //       (e) => DropdownMenuItem<String>(
                    //         value: e,
                    //         child: Text(e),
                    //       ),
                    //     )
                    //     .toList(),
                    onChanged: (item) {
                      if (item == 'Backend Engineer') {
                        specializationId = 1;
                      } else if (item == 'Frontend Engineer') {
                        specializationId = 2;
                      } else if (item == 'Mobile Engineer') {
                        specializationId = 3;
                      } else if (item == 'UI/UX Designer') {
                        specializationId = 4;
                      }
                      setState(() => selectedCat = item);
                    },
                    hint: const Text('Your specialization'),
                  ),
                ],
              ),
            ),
          ),
          // const SaveBottomBar()
          Container(
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
                onPressed: () {
                  UserAPI().updateProfile(
                    user.userData.id,
                    specializationId,
                    email,
                    firstname,
                    lastname,
                    user.userData.password,
                  );
                  Navigator.pushReplacementNamed(
                    context,
                    '/mainpage',
                    arguments: 3,
                  );
                },
                child: const Text('SAVE CHANGES'),
              ),
            ),
          ),
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
    final user = Provider.of<ProfileViewModel>(context);
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
                        initialValue: user.userData.password,
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
                      const SizedBox(height: 16),
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
                      const SizedBox(height: 16),
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
            '/mainpage',
          ),
          child: const Text('SAVE CHANGES'),
        ),
      ),
    );
  }
}
