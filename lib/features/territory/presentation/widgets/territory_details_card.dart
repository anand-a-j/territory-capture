import 'package:flutter/widgets.dart';
import 'package:territory_capture/core/extension/common.dart';
import 'package:territory_capture/features/territory/domain/entities/territory_entity.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/utils/format_utils.dart';

class TerritoryDetailsCard extends StatelessWidget {
  const TerritoryDetailsCard({super.key, required this.territory});

  final TerritoryEntity territory;

  @override
  Widget build(BuildContext context) {
    final distanceLabel = FormatUtils.formatDistance(territory.distanceMeters);
    final areaLabel = FormatUtils.formatArea(territory.areaSqMeters);
    final dateLabel = FormatUtils.formatDate(territory.createdAt);
    final pointCountLabel = territory.points.length.toString();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(AppConsts.pSide),
        child: Column(
          spacing: 14,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _DetailsTitle(title: "Captured On", label: dateLabel),
            _DetailsTitle(title: "Distance Walked", label: distanceLabel),
            _DetailsTitle(title: "Area Captured", label: areaLabel),
            _DetailsTitle(title: "Total Points", label: pointCountLabel),
          ],
        ),
      ),
    );
  }
}

class _DetailsTitle extends StatelessWidget {
  const _DetailsTitle({required this.title, required this.label});

  final String title;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: context.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
        ),
        Text(
          label,
          style: context.bodyMedium?.copyWith(fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
