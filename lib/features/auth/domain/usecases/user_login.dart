import 'package:blog_app/core/error/failuers.dart';
import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/core/common/entities/user.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserLogIn implements UseCase<User, UserLogInParams> {
  final AuthRepository authRepository;
  const UserLogIn(this.authRepository);

  @override
  Future<Either<Failure, User>> call(UserLogInParams parms) async {
    return await authRepository.logInWithEmailPassword(
      email: parms.email,
      password: parms.password,
    );
  }
}

class UserLogInParams {
  final String email;
  final String password;

  UserLogInParams({
    required this.email,
    required this.password,
  });
}
