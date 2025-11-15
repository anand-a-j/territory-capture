import 'package:territory_capture/features/territory/data/models/point_dto.dart';

import '../../domain/entities/territory_entity.dart';

class TerritoryDTO {
  final String id;
  final String userId;
  final DateTime createdAt;
  final double distanceMeters;
  final double? areaSqMeters;
  final List<PointDto> points;

  TerritoryDTO({
    required this.id,
    required this.userId,
    required this.createdAt,
    required this.distanceMeters,
    this.areaSqMeters,
    required this.points,
  });

  TerritoryEntity toEntity() => TerritoryEntity(
    id: id,
    userId: userId,
    createdAt: createdAt,
    distanceMeters: distanceMeters,
    areaSqMeters: areaSqMeters,
    points: points.map((p) => p.toEntity()).toList(),
  );

  factory TerritoryDTO.fromEntity(TerritoryEntity e) => TerritoryDTO(
    id: e.id,
    userId: e.userId,
    createdAt: e.createdAt,
    distanceMeters: e.distanceMeters,
    areaSqMeters: e.areaSqMeters,
    points: e.points.map((p) => PointDto.fromEntity(p)).toList(),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'userId': userId,
    'createdAt': createdAt.toIso8601String(),
    'distanceMeters': distanceMeters,
    'areaSqMeters': areaSqMeters,
    'points': points.map((p) => p.toJson()).toList(),
  };

  factory TerritoryDTO.fromJson(Map<String, dynamic> json) => TerritoryDTO(
    id: json['id'],
    userId: json['userId'],
    createdAt: DateTime.parse(json['createdAt']),
    distanceMeters: (json['distanceMeters'] as num).toDouble(),
    areaSqMeters: json['areaSqMeters'] == null
        ? null
        : (json['areaSqMeters'] as num).toDouble(),
    points: (json['points'] as List).map((e) => PointDto.fromJson(e)).toList(),
  );

  TerritoryDTO copyWith({
    String? id,
    String? userId,
    DateTime? createdAt,
    double? distanceMeters,
    double? areaSqMeters,
    List<PointDto>? points,
  }) {
    return TerritoryDTO(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      distanceMeters: distanceMeters ?? this.distanceMeters,
      areaSqMeters: areaSqMeters ?? this.areaSqMeters,
      points: points ?? this.points,
    );
  }
}
