class FirebaseAuthExeption implements Exception {
  final String message;
  FirebaseAuthExeption([this.message = "Authentication error"]);
}
