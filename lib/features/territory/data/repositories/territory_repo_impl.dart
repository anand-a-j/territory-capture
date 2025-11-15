import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/exeption.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/territory_entity.dart';
import '../../domain/repositories/territory_repository.dart';
import '../datasource/territory_datasource.dart';
import '../models/territory_dto.dart';

class TerritoryRepositoryImpl implements TerritoryRepository {
  final TerritoryRemoteDataSource remote;

  TerritoryRepositoryImpl(this.remote);

  @override
  Future<Either<Failure, void>> saveTerritory(TerritoryEntity entity) async {
    try {
      final dto = TerritoryDTO.fromEntity(entity);

      await remote.saveTerritory(dto);

      return const Right(null);
    } on DatabaseException catch (e) {
      return Left(Failure(e.message));
    } catch (_) {
      return Left(Failure("Unexpected error while saving territory"));
    }
  }

  @override
  Future<Either<Failure, List<TerritoryEntity>>> getUserTerritories(
    String userId,
  ) async {
    try {
      final list = await remote.getUserTerritories(userId);

      final entities = list.map((dto) => dto.toEntity()).toList();

      return Right(entities);
    } on DatabaseException catch (e) {
      return Left(Failure(e.message));
    } catch (_) {
      return Left(Failure("Unexpected error while loading territories"));
    }
  }
}
