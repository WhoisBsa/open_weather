import 'package:flutter/material.dart';
import 'package:open_weather/controllers/weather_controller.dart';
import 'package:open_weather/widgets/weather/weather_error.dart';
import 'package:open_weather/widgets/weather/weather_info.dart';
import 'package:open_weather/widgets/weather/weather_loading.dart';
import 'package:provider/provider.dart';

class WeatherScreen extends StatelessWidget {
  final VoidCallback onLogout;

  const WeatherScreen({super.key, required this.onLogout});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WeatherController(),
      child: Builder(
        builder: (context) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.read<WeatherController>().loadWeather();
          });
          return _WeatherContent(onLogout: onLogout);
        },
      ),
    );
  }
}

class _WeatherContent extends StatelessWidget {
  final VoidCallback onLogout;

  const _WeatherContent({required this.onLogout});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<WeatherController>();

    return Scaffold(
      appBar: _appBar(controller),
      body: Builder(builder: (context) {
        if (controller.loading) return const WeatherLoading();
        if (controller.error != null) return WeatherError(message: controller.error!);
        if (controller.weather != null) return WeatherInfo(weatherInfo: controller.weather!);
        return const SizedBox(); 
      }),
    );
  }

  AppBar _appBar(WeatherController controller) {
    return AppBar(
      title: const Text('The Weather by Matheus'),
      actions: [
        IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: controller.loadWeather,
          tooltip: 'Refresh',
        ),
        IconButton(
          icon: const Icon(Icons.logout),
          onPressed: onLogout,
          tooltip: 'Logout',
        ),
      ],
    );
  }
}
