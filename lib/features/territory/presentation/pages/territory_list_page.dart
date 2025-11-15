import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:territory_capture/core/extension/common.dart';
import 'package:territory_capture/features/territory/presentation/widgets/territory_card.dart';

import '../../../../core/components/custom_appbar.dart';
import '../../../../core/constants/app_constants.dart';
import '../controllers/territory_controller.dart';

class TerritoryListPage extends StatelessWidget {
  const TerritoryListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TerritoryController>();
    final uid = FirebaseAuth.instance.currentUser!.uid;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.loadTerritories(uid);
    });

    return Scaffold(
      appBar: CustomAppBar(
        title: "Captured Territories",
        leadingOnTap: () => Get.back(),
      ),

      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage.value.isNotEmpty) {
          return Center(
            child: Text(
              controller.errorMessage.value,
              style: context.bodyLarge?.copyWith(
                color: context.secondary.withValues(alpha: 0.6),
              ),
            ),
          );
        }

        if (controller.territories.isEmpty) {
          return Center(
            child: Text(
              "No territories captured yet",
              style: context.bodyLarge?.copyWith(
                color: context.secondary.withValues(alpha: 0.6),
              ),
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () async => controller.loadTerritories(uid),
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: AppConsts.pSide),
            itemCount: controller.territories.length,
            itemBuilder: (_, index) {
              final territory = controller.territories[index];
              return TerritoryCard(territory: territory);
            },
          ),
        );
      }),
    );
  }
}
