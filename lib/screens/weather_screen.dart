import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  final VoidCallback onLogout;

  const WeatherScreen({super.key, required this.onLogout});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
        actions: [
          IconButton(
            onPressed: onLogout,
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'Weather screen (TODO)',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
