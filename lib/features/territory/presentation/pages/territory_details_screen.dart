import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:territory_capture/core/utils/map_helper.dart';
import 'package:territory_capture/features/territory/domain/entities/territory_entity.dart';
import 'package:territory_capture/features/territory/presentation/widgets/territory_details_card.dart';

import '../../../../core/components/custom_appbar.dart';
import '../../../../core/theme/app_color_scheme.dart';

class TerritoryDetailsPage extends StatefulWidget {
  const TerritoryDetailsPage({super.key});


  @override
  State<TerritoryDetailsPage> createState() => _TerritoryDetailsPageState();
}

class _TerritoryDetailsPageState extends State<TerritoryDetailsPage> {
  GoogleMapController? _mapCtrl;

  @override
  Widget build(BuildContext context) {

     final TerritoryEntity territory = Get.arguments as TerritoryEntity;
    final points = MapHelper.toLatLngList(territory.points);

    final closedPolygon = MapHelper.closePolygon(points);

    final polygon = Polygon(
      polygonId: const PolygonId("territory_polygon"),
      points: closedPolygon,
      strokeWidth: 3,
      strokeColor: AppColorScheme.polygonFill,
      fillColor: AppColorScheme.polygonFill.withValues(alpha: 0.3),
    );

    return Scaffold(
      appBar: CustomAppBar(
        title: "Territory Details",
        leadingOnTap: () => Get.back(),
      ),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(20.0, 78.0),
          zoom: 14,
        ),
        polygons: {polygon},
        zoomControlsEnabled: false,
        onMapCreated: (controller) {
          _mapCtrl = controller;
          if (closedPolygon.isNotEmpty) {
            final bounds = MapHelper.latLngBounds(points);
            Future.delayed(const Duration(milliseconds: 300), () {
              _mapCtrl?.animateCamera(CameraUpdate.newLatLngBounds(bounds, 60));
            });
          }
        },
      ),
      bottomNavigationBar: TerritoryDetailsCard(territory: territory),
    );
  }
}
