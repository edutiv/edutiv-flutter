import 'package:edutiv/components/logo.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Logo(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Theme.of(context).primaryColor,
              width: double.infinity,
              height: 300,
              child: Column(
                children: [
                  Flexible(
                    flex: 1,
                    fit: FlexFit.loose,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Icon(Icons.edit, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  const Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50,
                    ),
                  ),
                  const Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: Text(
                      'Carl Johnson',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const ListTile(
              leading: Icon(Icons.card_giftcard_outlined),
              title: Text('Sertifikat Kamu'),
              trailing: Icon(Icons.chevron_right_outlined),
            ),
            const ListTile(
              leading: Icon(Icons.help_outline),
              title: Text('FAQ'),
              trailing: Icon(Icons.chevron_right_outlined),
            ),
            const ListTile(
              leading: Icon(Icons.warning_amber),
              title: Text('Syarat dan Ketentuan'),
              trailing: Icon(Icons.chevron_right_outlined),
            ),
            Center(
              child: TextButton.icon(
                style: TextButton.styleFrom(primary: Colors.red),
                onPressed: () {},
                icon: const Icon(
                  Icons.logout_outlined,
                ),
                label: const Text('Keluar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
