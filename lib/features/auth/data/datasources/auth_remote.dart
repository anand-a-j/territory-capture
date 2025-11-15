import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart' show debugPrint;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:territory_capture/core/errors/exeption.dart';

class AuthRemoteDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  static bool isInitialize = false;

  Future<void> _initGoogleSignIn() async {
    if (!isInitialize) {
      await _googleSignIn.initialize(
        serverClientId:
            '1036551375610-90g4ph8rdnn6i1pnfla1il242djhpdng.apps.googleusercontent.com',
      );
      isInitialize = true;
    }
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      await _initGoogleSignIn();

      final GoogleSignInAccount googleUser = await _googleSignIn.authenticate(
        scopeHint: ['email', 'profile'],
      );

      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      final GoogleSignInServerAuthorization? serverAuth = await googleUser
          .authorizationClient
          .authorizeServer(const ['email', 'profile']);

      if (serverAuth == null) {
        throw AuthExeption("Failed to retrieve Google ID Token");
      }

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      final userCred = await _auth.signInWithCredential(credential);

      return userCred;
    } catch (e) {
      debugPrint("signInWithGoogle ERROR : ${e.toString()}");
      throw AuthExeption("Something went wrong");
    }
  }

  Future<void> signOutGoogle() async {
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();
    } catch (e) {
      debugPrint("signOutGoogle ERROR : ${e.toString()}");
      throw AuthExeption("Something went wrong");
    }
  }
}