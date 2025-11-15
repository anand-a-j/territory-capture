import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:territory_capture/core/extension/common.dart';

import '../../../../core/constants/app_constants.dart';
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
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppConsts.rCircle),
          color: context.primary.withValues(alpha: 0.4),
          border: Border.all(width: 0.9, color: context.primary),
        ),
        child: Center(
          child: Text(
            "View Terrotories",
            style: context.bodyLarge?.copyWith(
              fontWeight: FontWeight.w500,
              color: context.primary,
            ),
          ),
        ),
      ),
    );
  }
}
