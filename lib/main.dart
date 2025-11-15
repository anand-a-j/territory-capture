import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:territory_capture/app.dart';
import 'package:territory_capture/core/utils/location_permission_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await LocationPermissionHelper.handleLocationPermission();
  runApp(const MyApp());
}