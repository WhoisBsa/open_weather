import 'package:flutter/material.dart';
import 'package:open_weather/models/weather_model.dart';
import 'package:open_weather/services/location_service.dart';
import 'package:open_weather/services/weather_service.dart';

class WeatherController extends ChangeNotifier {
  bool _loading = true;
  String? _error;
  WeatherModel? _weatherData;

  bool get loading => _loading;
  String? get error => _error;
  WeatherModel? get weather => _weatherData;

  Future<void> loadWeather() async {
    try {
      _loading = true;
      _error = null;
      notifyListeners();

      final position = await LocationService.determinePosition();
      final weather = await WeatherService.fetchWeather(
        position.latitude,
        position.longitude,
      );

      _weatherData = weather;
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
