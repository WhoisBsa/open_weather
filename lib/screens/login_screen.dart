import 'package:flutter/material.dart';
import 'package:open_weather/models/login_model.dart';
import 'package:open_weather/widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  final bool Function(LoginModel) onLogin;

  const LoginScreen({super.key, required this.onLogin});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 400),
          child: Padding(
            padding: EdgeInsets.all(24.0), 
            child: LoginForm(onLogin: onLogin)
          ),
        ),
      ),
    );
  }
}
