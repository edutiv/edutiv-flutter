import 'package:edutiv/model/profile/user_model.dart';
import 'package:flutter/material.dart';

class ProfileViewModel extends ChangeNotifier {
  final UserModel _user = UserModel(
    id: 1,
    firstName: 'Carl',
    lastName: 'Johnson',
    avatar: 'https://picsum.photos/id/156/200/300',
    email: 'cj@rockstar.com',
    password: '1111',
    specialization: 'UI/UX Designer',
    role: 'user',
  );

  UserModel get user => _user;
}
