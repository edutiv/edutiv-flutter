import 'package:edutiv/model/profile/user_model.dart';
import 'package:flutter/material.dart';

class ProfileViewModel extends ChangeNotifier {
  late UserModel _user;
  UserModel get user => _user;
  
}
