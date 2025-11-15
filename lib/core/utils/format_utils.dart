class FormatUtils {
  static String formatDistance(double meters) {
    if (meters < 1000) {
      return "${meters.toStringAsFixed(1)} m";
    }
    return "${(meters / 1000).toStringAsFixed(2)} km";
  }

 static String formatArea(double? sqMeters) {
    if (sqMeters == null) return "-";

    if (sqMeters < 10000) {
      return "${sqMeters.toStringAsFixed(1)} m²";
    }

    double sqKm = sqMeters / 1_000_000;
    return "${sqKm.toStringAsFixed(2)} km²";
  }

  static String formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year} "
        "${date.hour.toString().padLeft(2, '0')}:"
        "${date.minute.toString().padLeft(2, '0')}";
  }
}
