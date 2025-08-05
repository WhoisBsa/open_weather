import 'package:flutter/material.dart';
import 'package:open_weather/auth/auth_controller.dart';
import 'package:open_weather/screens/login_screen.dart';
import 'package:open_weather/screens/weather_screen.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  final AuthController _auth = AuthController();
  
  WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _auth, 
      builder: (context, isLoggedIn, _) {
        return _wrapper(isLoggedIn);
      },
    );
  }

  MaterialApp _wrapper(bool isLoggedIn) {
    return MaterialApp(
        title: 'Open Weather by Matheus Barbosa',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Color(0x0011343A)), // PANTONE - Ocean Depths
          fontFamily: 'Raleway'
        ),
        home: isLoggedIn
            ? WeatherScreen(onLogout: _auth.logout)
            : LoginScreen(onLogin: _auth.login),
      );
  }
}