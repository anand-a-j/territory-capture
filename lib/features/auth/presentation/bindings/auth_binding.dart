import 'package:get/get.dart';
import 'package:territory_capture/features/auth/data/datasources/auth_remote.dart';
import 'package:territory_capture/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:territory_capture/features/auth/domain/usecases/google_sign_in_usecase.dart';
import 'package:territory_capture/features/auth/domain/usecases/sign_out_usecase.dart';

import '../controllers/auth_controlller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(
      () => AuthController(
        googleSignInUseCase: GoogleSignInUseCase(
          AuthRepositoryImpl(AuthRemoteDataSource()),
        ),
        signoutUseCase: SignoutUseCase(
          AuthRepositoryImpl(AuthRemoteDataSource()),
        ),
      ),
    );
  }
}
