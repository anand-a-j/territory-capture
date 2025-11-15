import 'package:territory_capture/core/enum/location_permission_status.dart';

abstract class PermissionRepository {
  Future<LocationPermissionStatus> checkLocationPermission();
}
