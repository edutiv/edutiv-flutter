import 'package:edutiv/api/auth_api.dart';
import 'package:edutiv/model/auth/auth_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthViewModel extends ChangeNotifier {
  late TokenModel _loginTokenData;
  TokenModel get loginTokenData => _loginTokenData;

  late AuthModel _loginData;
  AuthModel get loginData => _loginData;

  Future login(String email, String password) async {
    final login = await AuthAPI().login(email, password);
    _loginTokenData = login;
    notifyListeners();
    return loginTokenData;
  }

  Future saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  Future<AuthModel> saveLoginData(Map<String, dynamic> json) async {
    return _loginData = AuthModel.fromJson(json);
  }
}
