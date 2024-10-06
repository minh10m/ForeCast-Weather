import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter/rendering.dart';
import 'package:weather_app_tutorial/constants/constants.dart';
import 'package:weather_app_tutorial/models/hourly_weather.dart';
import 'package:weather_app_tutorial/models/weather.dart';
import 'package:weather_app_tutorial/models/weekly_weather.dart';
import 'package:weather_app_tutorial/services/geolocator.dart';
import 'package:weather_app_tutorial/utils/logging.dart';

@immutable
class ApiHelper{
  static const baseUrl = 'https://api.openweathermap.org/data/2.5';
  static const weeklyWeatherUrl =
      'https://api.open-meteo.com/v1/forecast?current=&daily=weather_code,temperature_2m_max,temperature_2m_min&timezone=auto';

  static double lat = 0.0;
  static double lon = 0.0;

  static final dio = new Dio();

  static Future<void> fetchLocation() async {
    final location = await getLocation();
    lat = location.latitude;
    lon = location.longitude;
  }

  static Future<Weather> getCurrentWeather() async {
    await fetchLocation();

    final url = constructWeatherUrl();
    final response = await fetchData(url);
    return Weather.fromJson(response);
  }

  static Future<HourlyWeather> getHourlyWeather() async {
    await fetchLocation();

    final url = constructForecastUrl();
    final response = await fetchData(url);
    return HourlyWeather.fromJson(response);
  }

  static Future<WeeklyWeather> getWeaklyWeather() async {
    await fetchLocation();

    final url = constructWeeklyForecastUrl();
    final response = await fetchData(url);
    return WeeklyWeather.fromJson(response);
  }

  static Future<Weather> getWeatherByCityName({required String cityName}) async{
    final url = constructWeatherByCityUrl(cityName);
    final response = await fetchData(url);
    return Weather.fromJson(response);
  }

  static String constructWeatherUrl() =>
      '$baseUrl/weather?lat=$lat&lon=$lon&units=metric&appid=${Constants.apiKey}';

  static String constructForecastUrl() =>
      '$baseUrl/forecast?lat=$lat&lon=$lon&units=metric&appid=${Constants.apiKey}';

  static String constructWeatherByCityUrl(String city) =>
     '$baseUrl/weather?q=$city&units=metric&appid=${Constants.apiKey}';

  static String constructWeeklyForecastUrl() =>
      '$weeklyWeatherUrl&latitude=$lat&longitude=$lon';


  static Future<Map<String, dynamic>> fetchData(String url) async{
    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        printWarning('Failed to load data ${response.statusCode}');
        throw Exception('Failed to load data from the API');
      }
    } catch (error) {
      printWarning('Error fetching data $url');
      throw Exception('Failed to fetch data from the API');
    }

}

}
