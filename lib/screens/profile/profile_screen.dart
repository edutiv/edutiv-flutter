import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/profile/profile_viewmodel.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<ProfileViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: const Text('Profile'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: CircleAvatar(
              backgroundColor: const Color.fromARGB(62, 158, 158, 158),
              child: IconButton(
                onPressed: () => Navigator.pushNamed(context, '/courseDetail'),
                icon: const Icon(Icons.edit_outlined, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const ProfileHeader(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  ListTile(
                    onTap: () => Navigator.pushNamed(context, '/myCourse'),
                    tileColor: Colors.grey[200],
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    leading: const Icon(Icons.book),
                    title: const Text('My Course'),
                    trailing: const Icon(Icons.chevron_right_outlined),
                  ),
                  const SizedBox(height: 16),
                  ListTile(
                    tileColor: Colors.grey[200],
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    leading: const Icon(Icons.card_giftcard_outlined),
                    title: const Text('Certificate'),
                    trailing: const Icon(Icons.chevron_right_outlined),
                  ),
                  const SizedBox(height: 16),
                  ListTile(
                    tileColor: Colors.grey[200],
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    leading: const Icon(Icons.request_page_outlined),
                    title: const Text('Request'),
                    trailing: const Icon(Icons.chevron_right_outlined),
                  ),
                  const SizedBox(height: 16),
                  ListTile(
                    tileColor: Colors.grey[200],
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    leading: const Icon(Icons.info),
                    title: const Text('FAQ'),
                    trailing: const Icon(Icons.chevron_right_outlined),
                  ),
                  const SizedBox(height: 16),
                  ListTile(
                    tileColor: Colors.grey[200],
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    leading: const Icon(Icons.mail),
                    title: const Text('Email Support'),
                    trailing: const Icon(Icons.chevron_right_outlined),
                  ),
                  const SizedBox(height: 16),
                  ListTile(
                    tileColor: Colors.grey[200],
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    leading: const Icon(Icons.logout_outlined),
                    title: const Text('Logout'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<ProfileViewModel>(context);
    return Container(
      color: Theme.of(context).primaryColor,
      width: double.infinity,
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: CircleAvatar(
              backgroundColor: Colors.grey[400],
              radius: 50,
              child: CircleAvatar(
                radius: 45,
                backgroundImage: NetworkImage(user.user.avatar),
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            flex: 1,
            child: Text(
              user.user.firstName + ' ' + user.user.lastName,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: Text(
              user.user.specialization,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
