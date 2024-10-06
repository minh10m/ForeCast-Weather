import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_tutorial/extensions/datetime.dart';
import 'package:weather_app_tutorial/extensions/strings.dart';
import 'package:weather_app_tutorial/providers/get_weather_by_cityname_provider.dart';

import '../constants/text_styles.dart';
import '../providers/current_weather_provider.dart';
import '../views/gradient_container.dart';
import '../views/weather_info.dart';

class WeatherDetailsScreen extends ConsumerWidget {
  const WeatherDetailsScreen({super.key, required this.cityName});

  final String cityName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherData = ref.watch(WeatherByCityNameProvider(cityName));
    return Scaffold(
      body: weatherData.when(data: (weather) {
        return GradientContainer(children: [
          const SizedBox(
            width: double.infinity,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(weather.name, style: TextStyles.h1),
              const SizedBox(
                height: 20,
              ),
              Text(
                DateTime.now().dateTime,
                style: TextStyles.subtitleText,
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 260,
                child: Image.asset(
                    'assets/icons/${weather.weather[0].icon.replaceAll('n', 'd')}.png'),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                weather.weather[0].description.capitalize,
                style: TextStyles.h2,
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          WeatherInfo(
            weather: weather,
          ),
        ]);
      }, error: (error, stackTrace) {
        return Center(
          child: Text('An error occurred: $error'),
        );
      }, loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
