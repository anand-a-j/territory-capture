class AuthExeption implements Exception {
  final String message;
  AuthExeption([this.message = "Authentication error"]);

  @override
  String toString() => message;
}

class DatabaseException implements Exception {
  final String message;

  DatabaseException([this.message = "Database Server Error"]);

  @override
  String toString() => message;
}
