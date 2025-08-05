import 'package:flutter/material.dart';
import 'package:open_weather/models/login_model.dart';

class LoginForm extends StatefulWidget {
  final bool Function(LoginModel) onLogin;

  const LoginForm({super.key, required this.onLogin});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController(text: 'matheus@olly-olly.com');
  final TextEditingController _passwordController = TextEditingController(text: '123');

  String? _error;

  void _handleLogin() {
    if (_formKey.currentState?.validate() ?? false) {
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();

      final success = widget.onLogin(LoginModel(email: email, password: password));

      if (!success) {
        setState(() {
          _error = 'Invalid credentials. Try matheus@olly-olly.com / 123';
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Welcome to Open Weather App, $email!')),
        );
      }
    }
  }

  String? _handleValidateField(String? value, String text) {
    if (value == null || value.isEmpty) {
      return text;
    }

    return null;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _loginTextLabel(context),
          const SizedBox(height: 24),
          if (_error != null) _errorText(),
          _emailTextField(),
          const SizedBox(height: 16),
          _passwordTextField(),
          const SizedBox(height: 24),
          _loginButton(),
        ],
      ),
    );
  }

  Text _loginTextLabel(BuildContext context) {
    return Text(
      'Login',
      style: Theme.of(context).textTheme.headlineMedium
    );
  }

  Padding _errorText() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(_error!, style: const TextStyle(color: Colors.red)),
    );
  }

  TextFormField _emailTextField() {
    return TextFormField(
      controller: _emailController,
      decoration: const InputDecoration(
        labelText: 'Email',
        border: OutlineInputBorder(),
      ),
      validator: (value) => _handleValidateField(value, 'Enter email'),
    );
  }

  TextFormField _passwordTextField() {
    return TextFormField(
      controller: _passwordController,
      decoration: const InputDecoration(
        labelText: 'Password',
        border: OutlineInputBorder(),
      ),
      obscureText: true,
      validator: (value) => _handleValidateField(value, 'Enter password'),
    );
  }

  SizedBox _loginButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _handleLogin,
        child: const Text('Login'),
      ),
    );
  }
}
