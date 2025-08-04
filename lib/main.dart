import 'package:flutter/material.dart';
import 'package:open_weather/screens/login_screen.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Open Weather by Matheus Barbosa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0x0011343A)), // PANTONE
        fontFamily: 'Raleway'
      ),
      home: const LoginScreen(),
    );
  }
}