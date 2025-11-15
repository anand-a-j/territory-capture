import 'package:get/get.dart';
import 'package:territory_capture/features/territory/data/repositories/location_service_repo_impl.dart';
import 'package:territory_capture/features/territory/domain/usercases/get_position_usecase.dart';
import 'package:territory_capture/features/territory/domain/usercases/location_permission_usecase.dart';

import '../../data/repositories/location_permision_repo_impl.dart';
import '../controllers/map_capture_controller.dart';

class MapCapureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MapCaptureController>(
      () => MapCaptureController(
        locationPermissionUseCase: CheckLocationPermissionUseCase(
          PermissionRepositoryImpl(),
        ),
        getPositionStreamUseCase: GetPositionStreamUseCase(
          LocationServiceRepositoryImpl(),
        ),
      ),
    );
  }
}
