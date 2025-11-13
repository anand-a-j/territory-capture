import 'package:flutter/material.dart';
import 'package:territory_capture/core/extension/common.dart';

import '../constants/app_constants.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final bool isLoading;

  const CustomButton({
    super.key,
    required this.title,
    this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: context.primary,
          borderRadius: BorderRadius.circular(AppConsts.rMedium),
        ),
        alignment: Alignment.center,
        child: isLoading
            ? SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: context.onPrimary,
                ),
              )
            : Text(title, style: context.titleMedium),
      ),
    );
  }
}
