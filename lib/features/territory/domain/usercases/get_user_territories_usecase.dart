import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../entities/territory_entity.dart';
import '../repositories/territory_repository.dart';

class GetUserTerritoriesUseCase {
  final TerritoryRepository repository;

  GetUserTerritoriesUseCase(this.repository);

  Future<Either<Failure, List<TerritoryEntity>>> call(String userId) async {
    return await repository.getUserTerritories(userId);
  }
}
