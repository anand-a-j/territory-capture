import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:territory_capture/core/components/core_components.dart';

import '../controllers/auth_controlller.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();
    return Scaffold(
      body: Center(
        child: Obx(() {
          return CustomButton(
            title: "Sign in with google",
            isLoading: authController.isLoading.value,
            onTap: () {
              authController.googleLogin();
            },
          );
        }),
      ),
    );
  }
}
