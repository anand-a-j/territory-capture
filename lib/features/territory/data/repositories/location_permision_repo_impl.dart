import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../core/enum/location_permission_status.dart';
import '../../domain/repositories/location_permission_repository.dart';

class PermissionRepositoryImpl implements PermissionRepository {
  @override
  Future<LocationPermissionStatus> checkLocationPermission() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) return LocationPermissionStatus.serviceDisabled;

      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();

        if (permission == LocationPermission.denied) {
          return LocationPermissionStatus.denied;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return LocationPermissionStatus.deniedForever;
      }

      return LocationPermissionStatus.granted;
    } catch (e) {
      debugPrint("Permission Error: $e");
      return LocationPermissionStatus.error;
    }
  }
}
