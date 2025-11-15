import 'package:fpdart/fpdart.dart';
import 'package:geolocator/geolocator.dart';
import 'package:territory_capture/core/errors/failure.dart';

abstract class LocationServiceRepository {
  Future<Either<Failure, Stream<Position>>> getPositionStream();
}
