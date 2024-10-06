import 'package:riverpod/riverpod.dart';
import 'package:weather_app_tutorial/services/api_helper.dart';

final currentWeatherProvider= FutureProvider.autoDispose((ref){
  return ApiHelper.getCurrentWeather();
});