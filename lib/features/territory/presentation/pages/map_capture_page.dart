import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:territory_capture/core/extension/common.dart';
import 'package:territory_capture/core/theme/app_color_scheme.dart';
import 'package:territory_capture/features/territory/presentation/widgets/capture_control.dart';
import 'package:territory_capture/features/territory/presentation/widgets/sign_out_button.dart';
import 'package:territory_capture/features/territory/presentation/widgets/view_territories_button.dart';

import '../../../../core/components/custom_appbar.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/enum/territory_status.dart';
import '../controllers/map_capture_controller.dart';

class MapCapturePage extends StatelessWidget {
  const MapCapturePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MapCaptureController>();

    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          actions: [
            ViewTerritoriesButton(),
            const SizedBox(width: AppConsts.pMedium),
            SignOutButton(),
            const SizedBox(width: AppConsts.pSide),
          ],
        ),
        body: Obx(() {
          final polyline = Polyline(
            polylineId: const PolylineId("live_path"),
            points: controller.points.toList(),
            color: context.error,
            width: 4,
            startCap: Cap.roundCap,
            endCap: Cap.roundCap,
            jointType: JointType.round,
          );

          final polygon =
              controller.status.value == TerritoryStatus.finished &&
                  controller.points.length >= 3
              ? Polygon(
                  polygonId: const PolygonId("area"),
                  points: controller.points.toList(),
                  strokeColor: AppColorScheme.polygonFill,
                  fillColor: AppColorScheme.polygonFill.withValues(alpha: 0.3),
                  strokeWidth: 2,
                )
              : null;

          return GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: LatLng(20.5937, 78.9629),
              zoom: 16,
            ),
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            polylines: {polyline},
            polygons: polygon != null ? {polygon} : {},
            onMapCreated: (mapCtrl) {
              controller.setMapController(mapCtrl);
            },
          );
        }),
      
        bottomNavigationBar: CaptureControl(),
      ),
    );
  }
}
