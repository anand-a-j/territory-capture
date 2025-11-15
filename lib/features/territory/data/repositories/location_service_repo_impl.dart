import 'package:fpdart/fpdart.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/repositories/location_service_repo.dart';

class LocationServiceRepositoryImpl implements LocationServiceRepository {
  @override
  Future<Either<Failure, Stream<Position>>> getPositionStream() async {
    try {
      final stream = Geolocator.getPositionStream(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter: 3,
        ),
      );

      return Right(stream);
    } catch (e) {
      return Left(Failure("Failed to start location stream: $e"));
    }
  }
}
