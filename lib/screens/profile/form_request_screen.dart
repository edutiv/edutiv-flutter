import 'package:edutiv/model/profile/profile_viewmodel.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../homescreen/main_page.dart';

class FormRequestScreen extends StatefulWidget {
  const FormRequestScreen({Key? key}) : super(key: key);

  @override
  State<FormRequestScreen> createState() => _FormRequestScreenState();
}

class _FormRequestScreenState extends State<FormRequestScreen> {
  var formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final titleController = TextEditingController();
  String? selectedCat = 'Backend Engineer';
  String? selectedType = 'Course';
  int categoryId = 0;
  List<String> requestType = [
    'Course',
    '1 on 1 Consultation',
    'Bootcamp',
  ];
  Map<String, int> category = {
    'Backend Engineer': 1,
    'Frontend Engineer': 2,
    'Mobile Engineer': 3,
    'UI/UX Designer': 4
  };

  @override
  void initState() {
    final user = Provider.of<ProfileViewModel>(context, listen: false);
    categoryId = user.userData.specialization?.id ?? 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<ProfileViewModel>(context);
    // print('ini $selectedCat dengan id $categoryId');
    // print('ini $selectedType');
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
                    initialValue: user.userData.email,
                    // controller: emailController,
                    readOnly: true,
                    enabled: false,
                    style: const TextStyle(color: Colors.grey),
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
                          initialValue: user.userData.firstname,
                          readOnly: true,
                          enabled: false,
                          style: const TextStyle(color: Colors.grey),
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
                    controller: titleController,
                    validator: (val) {
                      if (titleController.text.isEmpty) {
                        return 'Title tidak boleh kosong!';
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
                    items: category.entries
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
                          categoryId = 1;
                        });
                      } else if (item == 'Frontend Engineer') {
                        setState(() {
                          categoryId = 2;
                        });
                      } else if (item == 'Mobile Engineer') {
                        setState(() {
                          categoryId = 3;
                        });
                      } else if (item == 'UI/UX Designer') {
                        setState(() {
                          categoryId = 4;
                        });
                      }
                      setState(() => selectedCat = item);
                    },
                    hint: const Text('Select categories'),
                  ),
                  const SizedBox(height: 14),
                  const Text('Type Request'),
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                    ),
                    value: selectedType,
                    items: requestType
                        .map(
                          (e) => DropdownMenuItem<String>(
                            value: e,
                            child: Text(e),
                          ),
                        )
                        .toList(),
                    onChanged: (item) => setState(() => selectedType = item),
                    hint: const Text('Choose request type'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          // print('ini id user ${user.userData.id}');
                          // print('ini category id $categoryId');
                          // print('ini title ${titleController.text}');
                          // print('ini tipe $selectedType');
                          await user.requestForm(
                            user.userData.id!,
                            titleController.text,
                            categoryId,
                            selectedType!,
                          );
                          await Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MainPage(index: 3),
                            ),
                          );
                        } else {
                          return;
                        }
                      },
                      child: const Text('SUBMIT REQUEST'),
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
