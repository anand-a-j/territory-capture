import 'package:get/get.dart';
import 'package:territory_capture/core/utils/app_snackbar.dart';
import 'package:territory_capture/features/auth/domain/usecases/google_sign_in_usecase.dart';
import 'package:territory_capture/features/auth/domain/usecases/sign_out_usecase.dart';

import '../../../../core/usecase/base.dart';
import '../../../../routes/app_routes.dart';

class AuthController extends GetxController {
  final GoogleSignInUseCase googleSignInUseCase;
  final SignoutUseCase signoutUseCase;

  AuthController({
    required this.googleSignInUseCase,
    required this.signoutUseCase,
  });

  final RxBool isLoading = false.obs;

  Future<void> googleLogin() async {
    isLoading.value = true;

    final result = await googleSignInUseCase(NoParams());

    isLoading.value = false;

    result.fold(
      (failure) {
        AppSnackBar.error("Error", failure.message);
      },
      (user) {
        Get.offNamed(AppRoutes.mapCapture);
      },
    );
  }

  Future<void> signOut() async {
    isLoading.value = true;

    final result = await signoutUseCase(NoParams());

    isLoading.value = false;

    result.fold(
      (failure) {
        AppSnackBar.error("Error", failure.message);
      },
      (user) {
        Get.offNamed(AppRoutes.signIn);
      },
    );
  }
}
