import 'package:dartz/dartz.dart';
import 'package:new_my_pharmacist/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity> signIn(String email, String password);
  Future<UserEntity> signUp(String email, String password);
  Future<void> signOut();
   Future<Either<String, void>> forgotPassword(String email);
}
