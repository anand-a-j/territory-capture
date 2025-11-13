import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:territory_capture/routes/app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.login, page: () => const SizedBox(),),
  ];
}
