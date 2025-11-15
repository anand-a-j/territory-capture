import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:territory_capture/core/extension/common.dart';
import 'package:territory_capture/features/auth/presentation/widgets/sign_in_button.dart';

import '../../../../core/constants/app_constants.dart';
import '../controllers/auth_controlller.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();
    return Scaffold(
      backgroundColor: context.primary,
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: AppConsts.pSide),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 8,
            children: [
              Text(
                "TERRITORY CAPTURE",
                style: context.headlineMedium?.copyWith(
                  color: context.onPrimary,
                  fontWeight: FontWeight.w800,
                ),
              ),

              Text(
                "Track. Capture. Measure.",
                style: context.bodyMedium?.copyWith(
                  color: context.onPrimary.withValues(alpha: 0.85),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(() {
        return SafeArea(
          child: SignInButton(
            title: "Sign in with google",

            isLoading: authController.isLoading.value,
            onTap: () {
              authController.googleLogin();
            },
          ),
        );
      }),
    );
  }
}
