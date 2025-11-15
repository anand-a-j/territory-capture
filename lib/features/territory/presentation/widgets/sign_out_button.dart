import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:territory_capture/core/extension/common.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../auth/presentation/controllers/auth_controlller.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();
    return Obx(() {
      if (authController.isLoading.value) {
        return CircularProgressIndicator();
      }
      return GestureDetector(
        onTap: () {
          authController.signOut();
        },
        child: Container(
          height: 42,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppConsts.rCircle),
            color: context.error.withValues(alpha: 0.4),
            border: Border.all(width: 0.9, color: context.error),
          ),
          child: Center(
            child: Icon(Icons.logout_outlined, color: context.error),
          ),
        ),
      );
    });
  }
}
