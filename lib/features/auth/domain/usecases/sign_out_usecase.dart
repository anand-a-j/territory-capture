import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecase/base.dart';
import '../repositories/auth_repo.dart';

class SignoutUseCase extends UseCase<void, NoParams> {
  final AuthRepository repository;

  SignoutUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(NoParams params) {
    return repository.signout();
  }
}
