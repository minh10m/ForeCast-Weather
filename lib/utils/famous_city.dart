import 'package:flutter/material.dart';

class FamousCity {
  final String name;
  final double lat;
  final double lon;

  const FamousCity({
    required this.name,
    required this.lat,
    required this.lon,
  });
}

List<FamousCity> famousCities = [
  const FamousCity(
      name: 'Hue',
      lat: 16.4668,
      lon: 107.6
  ),
  const FamousCity(
      name: 'Thanh pho Ho Chi Minh',
      lat: 10.76,
      lon: 106.667
  ),
  const FamousCity(
      name: 'New York',
      lat: 40.7128,
      lon: -74.0060
  ),
  const FamousCity(
      name: 'Paris',
      lat: 48.8566,
      lon: 2.3522
  ),
];