import 'package:flutter/material.dart';

class WeatherError extends StatelessWidget {
  final String message;

  const WeatherError({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message, style: TextStyle(color: Colors.red, fontSize: 16)),
    );
  }
}
