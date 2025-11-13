import '../../domain/entities/user_entity.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;

  AuthRepositoryImpl(this.remote);

  @override
  Future<UserEntity?> googleSignIn() async {
    final dto = await remote.googleSignIn();
    return dto?.toEntity();
  }

  @override
  Future<void> logout() => remote.logout();
}
