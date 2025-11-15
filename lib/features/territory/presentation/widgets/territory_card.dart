import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:territory_capture/core/extension/color_extension.dart';
import 'package:territory_capture/core/extension/textstyle_extension.dart';
import 'package:territory_capture/core/utils/format_utils.dart';
import 'package:territory_capture/features/territory/domain/entities/territory_entity.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../routes/app_routes.dart';

class TerritoryCard extends StatelessWidget {
  const TerritoryCard({super.key, required this.territory});

  final TerritoryEntity territory;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: GestureDetector(
        onTap: () {
          Get.toNamed(AppRoutes.territoryDetails, arguments: territory);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          margin: const EdgeInsets.only(bottom: AppConsts.pSmall),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppConsts.rMacro),
            color: context.primaryContainer,
          ),
          child: Column(
            spacing: 10,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    FormatUtils.formatDistance(territory.distanceMeters),
                    style: context.bodyLarge?.copyWith(),
                  ),
                  Text(
                    FormatUtils.formatDate(territory.createdAt),
                    style: context.bodyLarge?.copyWith(),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${territory.points.length} Points",
                    style: context.bodyMedium?.copyWith(
                      color: context.secondary.withValues(alpha: 0.6),
                    ),
                  ),
                  Icon(Icons.arrow_outward, color: context.secondary),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
