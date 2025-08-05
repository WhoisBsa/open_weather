import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:open_weather/models/weather_model.dart';

class WeatherService {
  static Future<WeatherModel> fetchWeather(double lat, double lon) async {
    final baseUrl = 'https://api.openweathermap.org/data/2.5/weather';
    final apiKey = dotenv.env['OPEN_WEATHER_API_KEY'];

    final url = '$baseUrl?lat=$lat&lon=$lon&exclude=minutely,hourly,daily&units=imperial&APPID=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode != 200) {
      throw Exception('Failed to load weather data');
    }

    return WeatherModel.fromJson(jsonDecode(response.body));
  }
}
