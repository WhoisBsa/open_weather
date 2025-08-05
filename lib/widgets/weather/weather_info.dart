import 'package:flutter/material.dart';
import 'package:open_weather/models/weather_model.dart';

class WeatherInfo extends StatelessWidget {
  final WeatherModel weatherInfo;

  const WeatherInfo({super.key, required this.weatherInfo});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            WeatherHeader(weatherInfo: weatherInfo),
            WeatherDetails(weatherInfo: weatherInfo)
          ],
        ),
      ),
    );
  }
}

class WeatherHeader extends StatelessWidget {
  final WeatherModel weatherInfo;

  const WeatherHeader({super.key, required this.weatherInfo});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Column(
        children: [
          const SizedBox(height: 24),

          // City name and country
          Text(
            weatherInfo.cityName,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 8),

          Text(
            weatherInfo.country,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 24),

          // Icon
          Card(
            color: const Color(0xFFDDEAEC),
            elevation: 4, // Sombra para destacar do fundo
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.network(
              'https://openweathermap.org/img/wn/${weatherInfo.icon}@4x.png',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          

          const SizedBox(height: 16),

          // Temp
          Text(
            '${weatherInfo.temperature.toStringAsFixed(1)}°F',
            style: theme.textTheme.displayMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          // Description
          Text(
            weatherInfo.main,
            style: theme.textTheme.titleMedium?.copyWith(
              letterSpacing: 1.2,
            ),
          ),

          const SizedBox(height: 24),

          // Summary
          Text(
            '"${weatherInfo.description}"',
            style: theme.textTheme.bodyMedium?.copyWith(
              fontStyle: FontStyle.italic,
              color: Colors.grey[700],
            ),
            textAlign: TextAlign.center,
          ),
          const Divider(height: 32),
        ],
      ),
    );
  }
}

class WeatherDetails extends StatelessWidget {
  final WeatherModel weatherInfo;

  const WeatherDetails({super.key, required this.weatherInfo});

  String windDirectionFromDeg(int deg) {
    const directions = [
      'North',
      'Northeast',
      'East',
      'Southeast',
      'South',
      'Southwest',
      'West',
      'Northwest',
      'North',
    ];
    int index = ((deg % 360) / 45).round();
    return directions[index];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WeatherDetailTile(
          label: 'Feels Like',
          value: '${weatherInfo.feelsLike.toStringAsFixed(1)} °F',
        ),
        WeatherDetailTile(
          label: 'Min Temp',
          value: '${weatherInfo.tempMin.toStringAsFixed(1)} °F',
        ),
        WeatherDetailTile(
          label: 'Max Temp',
          value: '${weatherInfo.tempMax.toStringAsFixed(1)} °F',
        ),
        WeatherDetailTile(label: 'Humidity', value: '${weatherInfo.humidity}%'),
        WeatherDetailTile(
          label: 'Pressure',
          value: '${weatherInfo.pressure} hPa',
        ),
        WeatherDetailTile(
          label: 'Wind Speed',
          value: '${weatherInfo.windSpeed} m/s',
        ),
        WeatherDetailTile(
          label: 'Wind Direction',
          value: windDirectionFromDeg(weatherInfo.windDeg),
        ),
      ],
    );
  }
}

class WeatherDetailTile extends StatelessWidget {
  final String label;
  final String value;

  const WeatherDetailTile({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 16)),
          Text(
            value,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
