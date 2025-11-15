import 'package:fpdart/fpdart.dart';
import 'package:territory_capture/core/errors/exeption.dart';
import 'package:territory_capture/core/errors/failure.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repo.dart';
import '../datasources/auth_remote.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;

  AuthRepositoryImpl(this.remote);

  @override
  Future<Either<Failure, UserEntity>> googleSignIn() async {
    try {
      final userCred = await remote.signInWithGoogle();

      if (userCred != null) {
        UserEntity user = UserEntity(
          uid: userCred.user?.uid ?? "",
          email: userCred.user?.email ?? "",
          name: userCred.user?.displayName ?? "",
          photoUrl: userCred.user?.photoURL ?? "",
        );

        return Right(user);
      } else {
        return Left(Failure("Sign In Failed User is null"));
      }
    } on AuthExeption catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> signout() async {
    try {
      await remote.signOutGoogle();
      return Right(null);
    } on AuthExeption catch (e) {
      return Left(Failure(e.message));
    }
  }
}