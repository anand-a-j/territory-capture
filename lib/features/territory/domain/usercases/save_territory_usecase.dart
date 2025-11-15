import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../entities/territory_entity.dart';
import '../repositories/territory_repository.dart';

class SaveTerritoryUseCase {
  final TerritoryRepository repository;

  SaveTerritoryUseCase(this.repository);

  Future<Either<Failure, void>> call(TerritoryEntity entity) async {
    return await repository.saveTerritory(entity);
  }
}
