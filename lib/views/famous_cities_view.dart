import 'package:flutter/material.dart';
import 'package:weather_app_tutorial/screens/weather_details_screen.dart';
import 'package:weather_app_tutorial/utils/famous_city.dart';

import '../Widgets/famous_city_tile.dart';

class FamousCitiesView extends StatelessWidget {
  const FamousCitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemCount: famousCities.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final city = famousCities[index];

        return InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => WeatherDetailsScreen(cityName: city.name,),
              ),
            );
          },
          child: FamousCityTile(index: index, city: city.name),
        );
      },
    );
  }
}
