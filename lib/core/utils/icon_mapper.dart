import 'package:flutter/material.dart';

class IconMapper {
  static IconData getIconFromName(String iconName) {
    switch (iconName) {
      case 'local_drink':
        return Icons.local_drink;
      case 'directions_run':
        return Icons.directions_run;
      case 'restaurant':
        return Icons.restaurant;
      case 'bedtime':
        return Icons.bedtime;
      case 'fitness_center':
        return Icons.fitness_center;
      case 'medical_services':
        return Icons.medical_services;
      // Add all other icon mappings...
      default:
        return Icons.health_and_safety;
    }
  }
}