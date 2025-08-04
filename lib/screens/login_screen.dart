import 'package:flutter/material.dart';
import 'package:open_weather/widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 400),
          child: Padding(
            padding: EdgeInsets.all(24.0), 
            child: LoginForm()
          ),
        ),
      ),
    );
  }
}
