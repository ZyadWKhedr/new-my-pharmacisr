import 'package:dartz/dartz.dart';
import 'package:new_my_pharmacist/features/auth/domain/entities/user_entity.dart';
import 'package:new_my_pharmacist/features/auth/domain/repositories/auth_repository.dart';


class SignInUseCase {
  final AuthRepository repository;

  SignInUseCase(this.repository);

  Future<Either<String, UserEntity>> call(String email, String password) async {
    try {
      final user = await repository.signIn(email, password);
      return Right(user); 
    } catch (error) {
      return Left(error.toString()); 
    }
  }
}
