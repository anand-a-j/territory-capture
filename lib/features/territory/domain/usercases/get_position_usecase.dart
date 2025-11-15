import 'package:fpdart/fpdart.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../core/errors/failure.dart';
import '../repositories/location_service_repo.dart';

class GetPositionStreamUseCase {
  final LocationServiceRepository repository;

  GetPositionStreamUseCase(this.repository);

  Future<Either<Failure, Stream<Position>>> call() {
    return repository.getPositionStream();
  }
}
