import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../repositories/territory_repository.dart';

class DeleteTerritoryUseCase {
  final TerritoryRepository repository;

  DeleteTerritoryUseCase(this.repository);

  Future<Either<Failure, void>> call(String territoryId) async {
    return await repository.deleteTerritory(territoryId);
  }
}
