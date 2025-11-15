import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationPermissionHelper {
  static Future<bool> handleLocationPermission() async {
    try {
      bool serviceEnabled;
      LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) return false;

      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) return false;
      }

      if (permission == LocationPermission.deniedForever) {
        return false;
      }

      return true;
    } catch (e) {
      debugPrint("handleLocationPermission Fun Error : ${e.toString()}");
      return false;
    }
  }
}
