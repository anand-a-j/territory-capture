import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:territory_capture/core/constants/app_constants.dart';
import 'package:territory_capture/core/theme/app_theme.dart';

import 'routes/app_pages.dart';
import 'routes/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConsts.appName,
      theme: AppThemes.lightThemeData(context),
      initialRoute: AppRoutes.splash,
      getPages: AppPages.pages,
    );
  }
}
