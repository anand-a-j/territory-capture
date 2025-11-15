import 'package:get/get.dart';

import '../controllers/map_capture_controller.dart';

class MapCapureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MapCaptureController>(() => MapCaptureController());
  }
}
