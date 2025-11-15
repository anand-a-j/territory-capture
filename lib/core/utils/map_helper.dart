import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../features/territory/domain/entities/point_entity.dart';

class MapHelper {
  /// Convert entity to LatLng
  static List<LatLng> toLatLngList(List<PointEntity> points) {
    return points.map((p) => LatLng(p.lat, p.lng)).toList();
  }

  /// Calculate closed ploygon
   static List<LatLng> closePolygon(List<LatLng> points) {
    if (points.length < 3) return points;

    final first = points.first;
    final last = points.last;

    if (first.latitude != last.latitude || first.longitude != last.longitude) {
      return [...points, first];
    }

    return points;
  }

  /// Calculate LatLng bounds
  static LatLngBounds latLngBounds(List<LatLng> points) {
    if (points.isEmpty) {
      throw ArgumentError("Points list cannot be empty");
    }

    double minLat = points.first.latitude;
    double maxLat = points.first.latitude;
    double minLng = points.first.longitude;
    double maxLng = points.first.longitude;

    for (final p in points) {
      if (p.latitude < minLat) minLat = p.latitude;
      if (p.latitude > maxLat) maxLat = p.latitude;
      if (p.longitude < minLng) minLng = p.longitude;
      if (p.longitude > maxLng) maxLng = p.longitude;
    }

    return LatLngBounds(
      southwest: LatLng(minLat, minLng),
      northeast: LatLng(maxLat, maxLng),
    );
  }
}
