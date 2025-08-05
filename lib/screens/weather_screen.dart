import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:open_weather/services/location_service.dart';

class WeatherScreen extends StatefulWidget {
  final VoidCallback onLogout;

  const WeatherScreen({super.key, required this.onLogout});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Position? _position;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadLocation();
  }

  Future<void> _loadLocation() async {
    try {
      final pos = await LocationService.determinePosition();
      setState(() => _position = pos);
    } catch (e) {
      setState(() => _error = e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
        actions: [
          IconButton(
            onPressed: widget.onLogout,
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
          ),
        ],
      ),
      body: Center(
        child: _error != null
            ? Text('Error: $_error', style: const TextStyle(color: Colors.red))
            : _position != null
            ? Text(
                'Your location: ${_position!.latitude}, ${_position!.longitude}',
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
