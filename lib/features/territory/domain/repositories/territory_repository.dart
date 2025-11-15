import 'package:fpdart/fpdart.dart';
import 'package:territory_capture/core/errors/failure.dart';

import '../entities/territory_entity.dart';

abstract class TerritoryRepository {
  Future<Either<Failure, void>>  saveTerritory(TerritoryEntity entity);

  Future<Either<Failure, List<TerritoryEntity>>> getUserTerritories(
    String userId,
  );
  
  Future<Either<Failure, void>>  deleteTerritory(String territoryId);
}
