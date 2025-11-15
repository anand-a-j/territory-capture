import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:territory_capture/features/territory/presentation/widgets/capture_button.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/enum/territory_status.dart';
import '../controllers/map_capture_controller.dart';

class CaptureControl extends StatelessWidget {
  const CaptureControl({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MapCaptureController>();

    return Padding(
      padding: const EdgeInsets.all(AppConsts.pSide),
      child: Obx(() {
        final status = controller.status.value;

        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          switchInCurve: Curves.easeOut,
          switchOutCurve: Curves.easeIn,

          transitionBuilder: (child, animation) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 0.3),
                end: Offset.zero,
              ).animate(animation),
              child: FadeTransition(opacity: animation, child: child),
            );
          },

          child: switch (status) {
            TerritoryStatus.idle ||
            TerritoryStatus.finished ||
            TerritoryStatus.discarded => Row(
              key: const ValueKey("idle"),
              children: [
                Expanded(
                  child: CaptureButton(
                    title: "Start",
                    color: Colors.green,
                    onTap: controller.startRecording,
                  ),
                ),
              ],
            ),

            TerritoryStatus.recording => Row(
              key: const ValueKey("recording"),
              children: [
                Expanded(
                  child: CaptureButton(
                    title: "Pause",
                    color: Colors.orange,
                    onTap: controller.pauseRecording,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CaptureButton(
                    title: "Finish",
                    color: Colors.blue,
                    onTap: () async {
                      await controller.completeAndSave();
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CaptureButton(
                    title: "Discard",
                    color: Colors.red,
                    onTap: controller.discardRecording,
                  ),
                ),
              ],
            ),

            TerritoryStatus.paused => Row(
              key: const ValueKey("paused"),
              children: [
                Expanded(
                  child: CaptureButton(
                    title: "Resume",
                    color: Colors.green,
                    onTap: controller.resumeRecording,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CaptureButton(
                    title: "Finish",
                    color: Colors.blue,
                    onTap: () async {
                      await controller.completeAndSave();
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CaptureButton(
                    title: "Discard",
                    color: Colors.red,
                    onTap: controller.discardRecording,
                  ),
                ),
              ],
            ),
          },
        );
      }),
    );
  }
}
