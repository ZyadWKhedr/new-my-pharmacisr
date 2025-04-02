import 'package:dartz/dartz.dart';
import 'package:new_my_pharmacist/features/auth/domain/repositories/auth_repository.dart';

class ForgotPasswordUseCase {
  final AuthRepository repository;

  ForgotPasswordUseCase(this.repository);

  Future<Either<String, void>> call(String email) {
    return repository.forgotPassword(email); // ✅ Matches updated return type
  }
}
