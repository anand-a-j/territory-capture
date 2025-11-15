import 'package:get/get.dart';

import '../../domain/entities/territory_entity.dart';
import '../../domain/usercases/delete_territory_usecase.dart';
import '../../domain/usercases/get_user_territories_usecase.dart';
import '../../domain/usercases/save_territory_usecase.dart';

class TerritoryController extends GetxController {
  final SaveTerritoryUseCase saveUseCase;
  final GetUserTerritoriesUseCase getUseCase;
  final DeleteTerritoryUseCase deleteUseCase;

  TerritoryController({
    required this.saveUseCase,
    required this.getUseCase,
    required this.deleteUseCase,
  });

  final RxBool isLoading = false.obs;
  final RxBool isDeleting = false.obs;

  /// 🔥 Only this is used for error handling
  final RxString errorMessage = "".obs;

  /// List of territories
  final RxList<TerritoryEntity> territories = <TerritoryEntity>[].obs;

  // ---------------------------------------------------------------------------
  // LOAD TERRITORIES
  // ---------------------------------------------------------------------------
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
        Get.snackbar("Error", failure.message);
      },
      (_) {
        Get.snackbar("Success", "Territory saved!");
      },
    );
  }

  Future<void> deleteTerritory(String territoryId, String userId) async {
    isDeleting.value = true;

    final result = await deleteUseCase(territoryId);

    isDeleting.value = false;

    result.fold(
      (failure) {
        Get.snackbar("Error", failure.message);
      },
      (_) {
        territories.removeWhere((t) => t.id == territoryId);
        Get.snackbar("Deleted", "Territory removed");
      },
    );
  }
}
