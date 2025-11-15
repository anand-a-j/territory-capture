import 'package:get/get.dart';
import 'package:territory_capture/core/utils/app_snackbar.dart';

import '../../domain/entities/territory_entity.dart';
import '../../domain/usercases/get_user_territories_usecase.dart';
import '../../domain/usercases/save_territory_usecase.dart';

class TerritoryController extends GetxController {
  final SaveTerritoryUseCase saveUseCase;
  final GetUserTerritoriesUseCase getUseCase;

  TerritoryController({required this.saveUseCase, required this.getUseCase});

  final RxBool isLoading = false.obs;
  final RxBool isDeleting = false.obs;

  final RxString errorMessage = "".obs;

  final RxList<TerritoryEntity> territories = <TerritoryEntity>[].obs;

  Future<void> loadTerritories(String userId) async {
    isLoading.value = true;
    errorMessage.value = "";

    final result = await getUseCase(userId);

    isLoading.value = false;

    result.fold(
      (failure) {
        errorMessage.value = failure.message;
      },
      (list) {
        errorMessage.value = "";
        territories.assignAll(list);
      },
    );
  }

  Future<void> saveTerritory(TerritoryEntity entity) async {
    isLoading.value = true;

    final result = await saveUseCase(entity);

    isLoading.value = false;

    result.fold(
      (failure) {
        AppSnackBar.error("Error", failure.message);
      },
      (_) {
        AppSnackBar.info("Success", "Territory saved!");
      },
    );
  }
}
