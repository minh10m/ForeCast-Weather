import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_tutorial/Widgets/subscript_text.dart';
import 'package:weather_app_tutorial/constants/app_colors.dart';
import 'package:weather_app_tutorial/constants/text_styles.dart';
import 'package:weather_app_tutorial/extensions/datetime.dart';
import 'package:weather_app_tutorial/providers/weekly_weather_provider.dart';
import 'package:weather_app_tutorial/utils/get_weather_icons.dart';

class WeeklyForecastView extends ConsumerWidget {
  const WeeklyForecastView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weeklyForecastData = ref.watch(weeklyWeatherProvider);

    return weeklyForecastData.when(data: (weeklyWeather) {
      return ListView.builder(
          itemCount: weeklyWeather.daily.weatherCode.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final dayOfWeek =
                DateTime.parse(weeklyWeather.daily.time[index]).dayOfWeek;
            final date = weeklyWeather.daily.time[index];
            final temp = weeklyWeather.daily.temperature2mMin[index];
            final icon = weeklyWeather.daily.weatherCode[index];

            return WeeklyWeatherTile(
              day: dayOfWeek,
              date: date,
              temp: temp.toInt(),
              icon: getWeatherIcon2(icon),
            );
          });
    }, error: (error, stackTrace) {
      return Text('Error: ${error}', style: TextStyle(color: Colors.red));
    }, loading: () {
      return const Center(child: CircularProgressIndicator());
    });
  }
}

class WeeklyWeatherTile extends StatelessWidget {
  const WeeklyWeatherTile(
      {super.key,
      required this.day,
      required this.date,
      required this.temp,
      required this.icon});

  final String day;
  final String date;
  final int temp;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      margin: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.accentBlue,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                day,
                style: TextStyles.h3,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(date, style: TextStyles.subtitleText),
            ],
          ),
          SubscriptText(
              text: temp.toString(),
              subscription: '°C',
              color: AppColors.white,
              subscriptionColor: AppColors.grey),
          Image.asset(icon, width: 60,),
        ],
      ),
    );
  }
}
