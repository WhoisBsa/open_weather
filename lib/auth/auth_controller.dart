import 'package:flutter/cupertino.dart';
import 'package:open_weather/models/login_model.dart';

class AuthController extends ValueNotifier<bool> {
  AuthController() : super(false);

  static const String validEmail = 'matheus@olly-olly.com';
  static const String validPwd = '123';

  bool login(LoginModel login) {
    var LoginModel(:email, :password) = login;

    if (email == validEmail && password == validPwd) {
      value = true;
      return true;
    }

    return false;
  }

  void logout() => value = false;
}
