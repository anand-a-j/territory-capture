import 'point_entity.dart';

class TerritoryEntity {
  final String id;
  final String userId;
  final DateTime createdAt;
  final double distanceMeters;
  final double? areaSqMeters;
  final List<PointEntity> points;

  TerritoryEntity({
    required this.id,
    required this.userId,
    required this.createdAt,
    required this.distanceMeters,
    this.areaSqMeters,
    required this.points,
  });
}
