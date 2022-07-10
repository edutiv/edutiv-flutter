import 'dart:io';

import 'package:edutiv/screens/homescreen/main_page.dart';
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
  int specializationId = 0;

  Map<String, int> specialization = {
    'Backend Engineer': 1,
    'Frontend Engineer': 2,
    'Mobile Engineer': 3,
    'UI/UX Designer': 4
  };

  File pp = File('assets/default_pp.png');

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<ProfileViewModel>(context, listen: false);
    String firstname = user.userData.firstname!;
    String lastname = user.userData.lastname!;
    var email = user.userData.email!;
    // int specializationId = user.userData.specialization?.id ?? 1;
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Profile Picture'),
                        Row(
                          children: [
                            CircleAvatar(
                                backgroundImage: NetworkImage(
                              user.userData.avatar ?? '',
                            )
                                // Image.file(pp).image,
                                ),
                            TextButton(
                              onPressed: () async {
                                FilePickerResult? result = await FilePicker
                                    .platform
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
                                initialValue: user.userData.firstname,
                                readOnly: true,
                                enabled: false,
                                style: const TextStyle(color: Colors.grey),
                                onChanged: (val) {
                                  setState(() {
                                    firstname = val;
                                  });
                                  print(firstname);
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
                                initialValue: user.userData.lastname,
                                readOnly: true,
                                enabled: false,
                                style: const TextStyle(color: Colors.grey),
                                onChanged: (val) {
                                  setState(() {
                                    lastname = val;
                                  });
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
                          initialValue: user.userData.email,
                          readOnly: true,
                          enabled: false,
                          style: const TextStyle(color: Colors.grey),
                          onChanged: (val) {
                            setState(() {
                              email = val;
                            });
                          },
                          validator: (email) {
                            if (email != null &&
                                !EmailValidator.validate(email)) {
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
                          value: user.userData.specialization?.categoryName ??
                              'Backend Engineer',
                          items: specialization.entries
                              .map(
                                (e) => DropdownMenuItem<String>(
                                  value: e.key,
                                  child: Text(e.key),
                                ),
                              )
                              .toList(),
                          onChanged: (item) {
                            if (item == 'Backend Engineer') {
                              setState(() {
                                specializationId = 1;
                              });
                            } else if (item == 'Frontend Engineer') {
                              setState(() {
                                specializationId = 2;
                              });
                            } else if (item == 'Mobile Engineer') {
                              setState(() {
                                specializationId = 3;
                              });
                            } else if (item == 'UI/UX Designer') {
                              setState(() {
                                specializationId = 4;
                              });
                            }
                            setState(() => selectedCat = item);
                          },
                          hint: const Text('Your specialization'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
              onPressed: () async {
                formKey.currentState!.save();
                formKey.currentState!.validate();

                await user.updateProfile(
                  specializationId,
                );
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainPage(index: 3),
                  ),
                );
              },
              child: const Text('SAVE CHANGES'),
            ),
          ),
        ),
      ],
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
  var formKey = GlobalKey<FormState>();
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController =
      TextEditingController();
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Old Password'),
                        TextFormField(
                          controller: currentPasswordController,
                          // initialValue: user.userData.password,
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
                          validator: (val) {
                            if (val == null) {
                              return 'Masukkan password saat ini!';
                            } else if (val.length < 4) {
                              return 'Password yang dimasukkan kurang dari 4 karakter!';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        const Text('Password'),
                        TextFormField(
                          controller: newPasswordController,
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
                          // onChanged: (val) {
                          //   newPasswordController.text = val;
                          // },
                          onSaved: (val) {
                            newPasswordController.text = val!;
                          },
                          validator: (val) {
                            if (val!.length < 4) {
                              return 'Password yang dimasukkan kurang dari 4 karakter!';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        const Text('Confirm Password'),
                        TextFormField(
                          controller: confirmNewPasswordController,
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
                          // onChanged: (val) {
                          //   confirmNewPasswordController.text = val;
                          // },
                          onSaved: (val) {
                            confirmNewPasswordController.text = val!;
                          },
                          validator: (val) {
                            if (confirmNewPasswordController.text !=
                                newPasswordController.text) {
                              return 'Password yang dimasukkan tidak sama!';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
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
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  await user.changePassword(
                    currentPasswordController.text,
                    newPasswordController.text,
                  );
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainPage(index: 3),
                    ),
                  );
                } else {
                  return;
                }
              },
              child: const Text('SAVE CHANGES'),
            ),
          ),
        ),
      ],
    );
  }
}

// class SaveBottomBar extends StatelessWidget {
//   const SaveBottomBar({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: 70,
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Color.fromARGB(62, 158, 158, 158),
//             blurRadius: 15,
//           ),
//         ],
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(12),
//         child: ElevatedButton(
//           onPressed: () => Navigator.pushNamed(
//             context,
//             '/mainpage',
//           ),
//           child: const Text('SAVE CHANGES'),
//         ),
//       ),
//     );
//   }
// }
