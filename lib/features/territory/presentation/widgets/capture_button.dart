import 'package:flutter/material.dart';
import 'package:territory_capture/core/constants/app_constants.dart';
import 'package:territory_capture/core/extension/common.dart';

class CaptureButton extends StatelessWidget {
  const CaptureButton({
    super.key,
    required this.title,
    required this.color,
    this.onTap,
  });

  final String title;
  final Color color;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 43,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(AppConsts.rCircle),
        ),
        child: Center(
          child: Text(
            title,
            style: context.titleMedium?.copyWith(color: context.onPrimary),
          ),
        ),
      ),
    );
  }
}
