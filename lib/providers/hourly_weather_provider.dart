import 'package:riverpod/riverpod.dart';
import 'package:weather_app_tutorial/services/api_helper.dart';

final hourlyWeatherProvider= FutureProvider.autoDispose((ref){
  return ApiHelper.getHourlyWeather();
});