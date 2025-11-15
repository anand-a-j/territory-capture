import 'package:flutter/material.dart';
import 'package:territory_capture/core/extension/common.dart';

import '../../../../core/constants/app_constants.dart';

class SignInButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final bool isLoading;

  const SignInButton({
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
        margin: const EdgeInsets.all(AppConsts.pSide),
        decoration: BoxDecoration(
          color: context.onPrimary,
          borderRadius: BorderRadius.circular(AppConsts.rMedium),
        ),
        alignment: Alignment.center,
        child: isLoading
            ? SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: context.primary,
                ),
              )
            : Text(
                title,
                style: context.titleMedium?.copyWith(color: context.primary),
              ),
      ),
    );
  }
}
