import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:territory_capture/core/constants/constants.dart';
import 'package:territory_capture/core/extension/common.dart';

import '../../../../routes/app_routes.dart';

class ViewTerritoriesButton extends StatelessWidget {
  const ViewTerritoriesButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.territoryList);
      },
      child: Container(
        height: 42,
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppConsts.rCircle),
          color: context.onPrimary,
          border: Border.all(width: 0.9, color: context.surface),
        ),
        child: Center(
          child: Text(
            "View Terrotories",
            style: context.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
