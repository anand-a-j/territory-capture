import 'package:territory_capture/core/enum/location_permission_status.dart';

import '../repositories/location_permission_repository.dart';

class CheckLocationPermissionUseCase {
  final PermissionRepository repository;

  CheckLocationPermissionUseCase(this.repository);

  Future<LocationPermissionStatus> call() {
    return repository.checkLocationPermission();
  }
}
