import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecase/base.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repo.dart';

class GoogleSignInUseCase extends UseCase<UserEntity, NoParams> {
  final AuthRepository repository;

  GoogleSignInUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(NoParams params) {
    return repository.googleSignIn();
  }
}
