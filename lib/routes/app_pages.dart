import 'package:get/get_navigation/get_navigation.dart';
import 'package:territory_capture/core/splash/splash_page.dart';
import 'package:territory_capture/features/auth/presentation/bindings/auth_binding.dart';
import 'package:territory_capture/features/auth/presentation/screens/sign_in_page.dart';
import 'package:territory_capture/features/territory/presentation/bindings/map_capture_binding.dart';
import 'package:territory_capture/features/territory/presentation/pages/map_capture_page.dart';
import 'package:territory_capture/features/territory/presentation/pages/territory_details_screen.dart';
import 'package:territory_capture/features/territory/presentation/pages/territory_list_page.dart';
import 'package:territory_capture/routes/app_routes.dart';

import '../features/territory/presentation/bindings/territory_binding.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.signIn,
      page: () => const SignInPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.mapCapture,
      page: () => const MapCapturePage(),
      bindings: [
        AuthBinding(),
        MapCapureBinding(),
        TerritoryBinding(),
      ]
    ),
    GetPage(
      name: AppRoutes.territoryList,
      page: () => const TerritoryListPage(),
      binding: TerritoryBinding(),
    ),
    GetPage(
      name: AppRoutes.territoryDetails,
      page: () => const TerritoryDetailsPage(),
    ),
  ];
}
