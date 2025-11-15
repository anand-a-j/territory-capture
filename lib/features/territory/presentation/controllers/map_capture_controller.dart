import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:territory_capture/core/utils/location_permission_helper.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:territory_capture/features/territory/domain/entities/territory_entity.dart';
import 'package:geodesy/geodesy.dart' as geo;

import '../../../../core/enum/territory_status.dart';
import '../../domain/entities/point_entity.dart';
import 'territory_controller.dart';

class MapCaptureController extends GetxController {
  final Rx<TerritoryStatus> status = TerritoryStatus.idle.obs;

  final RxList<LatLng> points = <LatLng>[].obs;
  final RxDouble distanceMeters = 0.0.obs;

  StreamSubscription<Position>? _positionSub;
  GoogleMapController? mapController;

  void setMapController(GoogleMapController controller) {
    debugPrint("🔥 Map controller set");
    mapController = controller;
  }

  Future<void> startRecording() async {
    if (status.value == TerritoryStatus.recording) return;

    final hasPermission =
        await LocationPermissionHelper.handleLocationPermission();
    if (!hasPermission) {
      Get.snackbar("Error", "Location permission required");
      return;
    }

    points.clear();
    distanceMeters.value = 0.0;
    status.value = TerritoryStatus.recording;

    await _positionSub?.cancel();

    _positionSub =
        Geolocator.getPositionStream(
          locationSettings: const LocationSettings(
            accuracy: LocationAccuracy.high,
            distanceFilter: 3,
          ),
        ).listen((pos) {
          if (status.value != TerritoryStatus.recording) return;

          final point = LatLng(pos.latitude, pos.longitude);

          mapController?.animateCamera(CameraUpdate.newLatLng(point));

          if (points.isNotEmpty) {
            final last = points.last;
            final seg = Geolocator.distanceBetween(
              last.latitude,
              last.longitude,
              point.latitude,
              point.longitude,
            );
            distanceMeters.value += seg;
          }

          points.add(point);
        });
  }

  void pauseRecording() {
    if (status.value == TerritoryStatus.recording) {
      status.value = TerritoryStatus.paused;
    }
  }

  void resumeRecording() {
    if (status.value == TerritoryStatus.paused) {
      status.value = TerritoryStatus.recording;
    }
  }

  Future<TerritoryEntity> finishRecording(String userId) async {
    if (status.value == TerritoryStatus.idle) {
      throw Exception("Cannot finish — recording never started");
    }

    status.value = TerritoryStatus.finished;

    if (points.length >= 3) {
      final first = points.first;
      final last = points.last;

      if (first.latitude != last.latitude ||
          first.longitude != last.longitude) {
        points.add(first);
      }
    }

    double? area;
    if (points.length >= 3) {
      final geoPoints = points
          .map((p) => geo.LatLng(p.latitude, p.longitude))
          .toList();

      area = geo.PolygonArea.calculatePolygonArea(geoPoints).abs();
    }

    await _positionSub?.cancel();
    _positionSub = null;

    return TerritoryEntity(
      id: "",
      userId: userId,
      createdAt: DateTime.now(),
      distanceMeters: distanceMeters.value,
      areaSqMeters: area,
      points: points
          .map(
            (p) => PointEntity(
              lat: p.latitude,
              lng: p.longitude,
              timestamp: DateTime.now().millisecondsSinceEpoch,
            ),
          )
          .toList(),
    );
  }

  Future<void> completeAndSave() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final territory = await finishRecording(uid);

    final tController = Get.find<TerritoryController>();
    await tController.saveTerritory(territory);
  }

  Future<void> discardRecording() async {
    await _positionSub?.cancel();
    _positionSub = null;

    points.clear();
    distanceMeters.value = 0.0;

    status.value = TerritoryStatus.discarded;

    Future.delayed(const Duration(milliseconds: 150), () {
      status.value = TerritoryStatus.idle;
    });
  }

  @override
  void onClose() {
    _positionSub?.cancel();
    super.onClose();
  }
}
