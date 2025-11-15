import '../../domain/entities/point_entity.dart';

class PointDto {
  final double lat;
  final double lng;
  final int timestamp;

  PointDto({required this.lat, required this.lng, required this.timestamp});

  PointEntity toEntity() =>
      PointEntity(lat: lat, lng: lng, timestamp: timestamp);

  factory PointDto.fromEntity(PointEntity e) =>
      PointDto(lat: e.lat, lng: e.lng, timestamp: e.timestamp);

  factory PointDto.fromJson(Map<String, dynamic> json) => PointDto(
    lat: (json['lat'] as num).toDouble(),
    lng: (json['lng'] as num).toDouble(),
    timestamp: json['timestamp'] as int,
  );

  Map<String, dynamic> toJson() => {
    'lat': lat,
    'lng': lng,
    'timestamp': timestamp,
  };

  PointDto copyWith({double? lat, double? lng, int? timestamp}) {
    return PointDto(
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      timestamp: timestamp ?? this.timestamp,
    );
  }
}
