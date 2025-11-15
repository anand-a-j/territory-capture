import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:territory_capture/core/constants/app_constants.dart';
import 'package:territory_capture/core/extension/common.dart';
import 'package:territory_capture/routes/app_routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    _checkAuth();
  }

  Future<void> _checkAuth() async {
    await Future.delayed(const Duration(seconds: 2));

    if (_auth.currentUser != null) {
      Get.offAllNamed(AppRoutes.mapCapture);
    } else {
      Get.offAllNamed(AppRoutes.signIn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.primary,
      body: Center(
        child:  Padding(
          padding: const EdgeInsets.all(AppConsts.pSide),
          child: Text(
            "TERRITORY CAPTURE",
            style: context.headlineMedium?.copyWith(
              color: context.onPrimary,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}
