import 'package:flutter/material.dart';
import 'package:weather_app_tutorial/constants/app_colors.dart';
import 'package:weather_app_tutorial/screens/forecast_screen.dart';
import 'package:weather_app_tutorial/screens/search_screen.dart';
import 'package:weather_app_tutorial/screens/weather_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _index = 0;

  final _destinations = const [
    NavigationDestination(
        icon: Icon(Icons.home_outlined, color: Colors.white,),
        selectedIcon: Icon(Icons.home, color: Colors.white,),
        label: 'Home'
    ),
    NavigationDestination(
        icon: Icon(Icons.search_outlined, color: Colors.white,),
        selectedIcon: Icon(Icons.search, color: Colors.white,),
        label: 'Search'
    ),
    NavigationDestination(
        icon: Icon(Icons.wb_sunny_outlined, color: Colors.white,),
        selectedIcon: Icon(Icons.wb_sunny, color: Colors.white,),
        label: 'Weather',
    ),
    NavigationDestination(
        icon: Icon(Icons.settings_outlined, color: Colors.white,),
        selectedIcon: Icon(Icons.settings, color: Colors.white,),
        label: 'Settings'
    )
  ];

  final _screen = [
    const WeatherScreen(),
    const SearchScreen(),
    const ForecastScreen(),
    const Center(
      child: Text('setting Screen'),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _screen[_index],
        bottomNavigationBar: NavigationBarTheme(
          data: const NavigationBarThemeData(
            backgroundColor: AppColors.secondaryBlack,
          ),
          child: NavigationBar(
              destinations: _destinations,
              labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            selectedIndex: _index,
            indicatorColor: Colors.transparent,
            onDestinationSelected: (index) {
                setState(() {
                  _index = index;
                });
          
            },
          ),
        )
    );
  }
}