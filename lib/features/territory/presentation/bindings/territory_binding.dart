import 'package:get/get.dart';
import 'package:territory_capture/features/territory/data/datasource/territory_datasource.dart';
import 'package:territory_capture/features/territory/data/repositories/territory_repo_impl.dart';
import 'package:territory_capture/features/territory/domain/usercases/delete_territory_usecase.dart';
import 'package:territory_capture/features/territory/domain/usercases/get_user_territories_usecase.dart';
import 'package:territory_capture/features/territory/domain/usercases/save_territory_usecase.dart';
import 'package:territory_capture/features/territory/presentation/controllers/territory_controller.dart';

class TerritoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TerritoryController>(
      () => TerritoryController(
        saveUseCase: SaveTerritoryUseCase(
          TerritoryRepositoryImpl(TerritoryRemoteDataSource()),
        ),
        getUseCase: GetUserTerritoriesUseCase(
          TerritoryRepositoryImpl(TerritoryRemoteDataSource()),
        ),
        deleteUseCase: DeleteTerritoryUseCase(
          TerritoryRepositoryImpl(TerritoryRemoteDataSource()),
        ),
      ),
    );
  }
}
